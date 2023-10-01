class ItemDrop < ApplicationRecord
  belongs_to :item
  belongs_to :monster_template

  validates :odds, presence: true
end
