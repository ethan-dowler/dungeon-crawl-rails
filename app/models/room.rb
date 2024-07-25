class Room < ApplicationRecord
  belongs_to :floor
  belongs_to :room_template

  has_one :dungeon, through: :floor
  has_many :room_encounters, through: :room_template

  # possible monsters for this room, based on the floor

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

  delegate_missing_to :room_template

  after_create :populate_monsters

  def entrance?
    dungeon.entrance_room_id == id
  end

  private

  def populate_monsters
    room_encounters.each do |encounter|
      next unless Random.new.rand(100) < encounter.percent_chance

      monsters.create!(monster_template: encounter.monster_template)
    end
  end
end
