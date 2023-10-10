class Room < ApplicationRecord
  # which floor of the dungeon this room is on
  belongs_to :floor
  has_one :dungeon, through: :floor
  # possible monsters for this room, based on the floor
  has_many :floor_encounters, through: :floor

  # monsters in this room
  has_many :monsters, foreign_key: :current_room_id, inverse_of: :current_room, dependent: nil

  # adjoining rooms
  belongs_to :north_room, class_name: 'Room', optional: true
  belongs_to :east_room, class_name: 'Room', optional: true
  belongs_to :south_room, class_name: 'Room', optional: true
  belongs_to :west_room, class_name: 'Room', optional: true
  # going from one floor to another
  belongs_to :above_room, class_name: 'Room', optional: true
  belongs_to :below_room, class_name: 'Room', optional: true

  scope :entrances, -> { where(entrance: true) }
  scope :exits, -> { where(exit: true) }

  after_create :populate_monsters, unless: :entrance?

  def entrance?
    dungeon.entrance_room_id == id
  end

private

  # TODO: allow for chance of multiple monsters
  # or no monsters at all
  # currently populates one monster per room
  def populate_monsters
    random_encounter =
      floor_encounters.each_with_object([]) do |encounter, pool|
        encounter.odds.times { pool << encounter }
      end.sample

    monsters.create!(
      monster_template: random_encounter.monster_template,
      level: random_encounter.level_range.to_a.sample
    )
  end
end
