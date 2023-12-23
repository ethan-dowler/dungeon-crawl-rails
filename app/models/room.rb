class Room < ApplicationRecord
  # which floor of the dungeon this room is on
  belongs_to :floor
  has_one :dungeon, through: :floor
  # possible monsters for this room, based on the floor
  has_many :floor_encounters, through: :floor

  # monsters in this room
  has_many :monsters, foreign_key: :current_room_id, inverse_of: :current_room, dependent: nil

  # adjoining rooms
  belongs_to :north_room, class_name: "Room", optional: true
  belongs_to :east_room, class_name: "Room", optional: true
  belongs_to :south_room, class_name: "Room", optional: true
  belongs_to :west_room, class_name: "Room", optional: true
  # going from one floor to another
  belongs_to :above_room, class_name: "Room", optional: true
  belongs_to :below_room, class_name: "Room", optional: true

  scope :entrances, -> { where(entrance: true) }
  scope :exits, -> { where(exit: true) }

  after_create :populate_monsters, unless: :entrance?

  def entrance?
    dungeon.entrance_room_id == id
  end

  private

  def populate_monsters
    floor_encounters.each do |encounter|
      next unless Random.new.rand(100) < encounter.percent_chance

      monsters.create!(
        monster_template: encounter.monster_template,
        level: encounter.level_range.to_a.sample
      )
    end
  end
end
