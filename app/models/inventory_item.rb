class InventoryItem < ApplicationRecord
  belongs_to :owner, polymorphic: true
  belongs_to :item

  has_many :modifiers, through: :item

  after_create :consolidate_stacks, if: :stackable?

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

  delegate :name, :equipment_slot, :equippable?, :stackable?, :handheld?, to: :item
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
end
