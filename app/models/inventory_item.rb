class InventoryItem < ApplicationRecord
  belongs_to :character
  belongs_to :item

  has_many :modifiers, through: :item

  scope :equipped, -> { where(equipped: true) }
  scope :unequipped, -> { where(equipped: false) }

  def equip = update!(equipped: true)
  def unequip = update!(equipped: false)
end
