class MonsterTemplate < ApplicationRecord
  has_many :item_drops, dependent: :destroy
  has_many :monsters, dependent: :destroy
end
