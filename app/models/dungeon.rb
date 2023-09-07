class Dungeon < ApplicationRecord
  has_many :rooms

  # TODO: allow characters to unlock dungeons as they grow
  scope :available_to, ->(character) { Dungeon.all }
end
