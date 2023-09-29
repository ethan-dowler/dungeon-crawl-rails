class Dungeon < ApplicationRecord
  has_many :floors
  has_many :rooms, through: :floors

  # TODO: allow characters to unlock dungeons as they grow
  scope :available_to, ->(character) { Dungeon.all }
end
