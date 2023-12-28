class Dungeon < ApplicationRecord
  belongs_to :dungeon_template
  belongs_to :entrance_room, class_name: "Room", optional: true

  has_many :floors, dependent: :destroy
  has_many :rooms, through: :floors
  has_many :monsters, through: :rooms

  delegate :name, to: :dungeon_template

  def first_floor
    @first_floor ||= floors.find_by(level: 1)
  end

  module Direction
    NORTH = "north".freeze
    EAST = "east".freeze
    SOUTH = "south".freeze
    WEST = "west".freeze
    ABOVE = "above".freeze
    BELOW = "below".freeze

    ALL = [NORTH, EAST, SOUTH, WEST, ABOVE, BELOW].freeze
  end
end
