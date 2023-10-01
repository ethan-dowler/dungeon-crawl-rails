class MonsterTemplate < ApplicationRecord
  has_many :item_drops
  has_many :monsters
end
