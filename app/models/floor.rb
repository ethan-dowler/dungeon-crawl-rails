class Floor < ApplicationRecord
  belongs_to :dungeon

  has_many :rooms, dependent: :destroy
  has_many :floor_encounters, dependent: :destroy
end
