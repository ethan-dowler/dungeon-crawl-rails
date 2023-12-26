class InventoryItem < ApplicationRecord
  belongs_to :owner, polymorphic: true
  belongs_to :item

  has_many :modifiers, through: :item
  has_many :personality_traits, through: :item
  has_many :traits, through: :personality_traits

  after_create :consolidate_stacks, if: :stackable?
  after_update :resolve_modifiers, if: :equipped_previously_changed?
  after_destroy :destroy_modifiers, if: :equipped?

  scope :alphabetical, -> { joins(:item).order("items.name") }

  scope :equipment, -> { joins(:item).where.not(items: { equipment_slot: nil }) }
  scope :non_equipment, -> { joins(:item).where(items: { equipment_slot: nil }) }
  scope :equipped, -> { where(equipped: true) }
  scope :unequipped, -> { where(equipped: false) }

  scope :like_me, ->(inventory_item) do
    where(owner: inventory_item.owner, item: inventory_item.item)
  end
  scope :not_me, ->(inventory_item) do
    where.not(id: inventory_item.id)
  end
  scope :others_like_me, ->(inventory_item) do
    like_me(inventory_item).not_me(inventory_item)
  end

  scope :with_same_slot, ->(inventory_item) do
    joins(:item).where(item: { equipment_slot: inventory_item.equipment_slot })
  end

  delegate_missing_to :item

  def equip
    EquipInventoryItem.new(self).execute
  end

  def unequip
    UnequipInventoryItem.new(self).execute
  end

  private

  def consolidate_stacks
    return if InventoryItem.others_like_me(self).none?

    # combine multiple "stacks" of stackable items
    # a "stack" is an inventory item with quantity > 1
    InventoryItem.transaction do
      stacks = InventoryItem.like_me(self)
      total_quantity = stacks.sum(:quantity)
      consolidated_stack = stacks.first
      consolidated_stack.update!(quantity: total_quantity)
      InventoryItem.others_like_me(consolidated_stack).destroy_all
    end
  end

  def resolve_modifiers
    destroy_modifiers # prevent duplicate modifiers from re-equipping the same item
    create_modifiers if equipped?
  end

  def create_modifiers
    InventoryItem.transaction do
      modifiers.each do |modifier|
        modifier.dup.update!(target: owner, source: self)
      end
    end
  end

  def destroy_modifiers
    Modifier.where(target: owner, source: self).destroy_all
  end
end
