class InventoryItem < ApplicationRecord
  belongs_to :owner, polymorphic: true
  belongs_to :item

  has_many :modifiers, through: :item

  scope :equipped, -> { where(equipped: true) }
  scope :unequipped, -> { where(equipped: false) }

  delegate :name, :equippable?, :handheld?, to: :item
end
