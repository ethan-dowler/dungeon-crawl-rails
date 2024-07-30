class Item < ApplicationRecord
  belongs_to :owner, polymorphic: true
  belongs_to :item_template

  has_many :modifiers, through: :item_template
  has_many :personality_traits, through: :item_template
  has_many :traits, through: :personality_traits

  after_create :consolidate_stacks, if: :stackable?
  after_update :resolve_modifiers, if: :equipped_previously_changed?
  after_destroy :destroy_modifiers, if: :equipped?

  scope :alphabetical, -> { joins(:item_template).order("item_templates.name") }

  scope :equipment, -> { joins(:item_template).merge(ItemTemplate.equipment) }
  scope :non_equipment, -> { joins(:item_template).merge(ItemTemplate.non_equipment) }

  scope :armor, -> { joins(:item_template).merge(ItemTemplate.armor) }
  scope :primary, -> { joins(:item_template).merge(ItemTemplate.primary) }
  scope :secondary, -> { joins(:item_template).merge(ItemTemplate.secondary) }

  scope :two_handed, -> { joins(:item_template).merge(ItemTemplate.two_handed) }

  scope :equipped, -> { where(equipped: true) }
  scope :unequipped, -> { where(equipped: false) }

  # used for managing "stacks"; i.e. multiple of the same stackable item; e.g. coins
  scope :like_me, ->(item) do
    where(owner: item.owner, item: item.item)
  end
  scope :not_me, ->(item) do
    where.not(id: item.id)
  end
  scope :others_like_me, ->(item) do
    like_me(item).not_me(item)
  end

  scope :with_same_slot, ->(item) do
    joins(:item).where(item: { equipment_slot: item.equipment_slot })
  end

  delegate_missing_to :item_template

  def equip
    EquipInventoryItem.new(self).execute
  end

  def unequip
    UnequipInventoryItem.new(self).execute
  end

  private

  def consolidate_stacks
    return if Item.others_like_me(self).none?

    # combine multiple "stacks" of stackable items
    # a "stack" is an inventory item with quantity > 1
    Item.transaction do
      stacks = Item.like_me(self)
      total_quantity = stacks.sum(:quantity)
      consolidated_stack = stacks.first
      consolidated_stack.update!(quantity: total_quantity)
      Item.others_like_me(consolidated_stack).destroy_all
    end
  end

  def resolve_modifiers
    destroy_modifiers # prevent duplicate modifiers from re-equipping the same item
    create_modifiers if equipped?
  end

  def create_modifiers
    Item.transaction do
      modifiers.each do |modifier|
        owner.modifiers.create!(
          source: self, stat: modifier.stat, modifier_type: modifier.modifier_type, value: modifier.value
        )
      end
    end
  end

  def destroy_modifiers
    Modifier.where(target: owner, source: self).destroy_all
  end
end
