class InventoryItem < ApplicationRecord
  belongs_to :item
  has_many :modifiers, through: :item
end
