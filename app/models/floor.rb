class Floor < ApplicationRecord
  belongs_to :dungeon

  has_many :rooms
end
