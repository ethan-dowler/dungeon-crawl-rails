class RoomTemplate < ApplicationRecord
  belongs_to :floor_template
  has_one :dungeon_template, through: :floor_template
  has_many :room_encounters, dependent: :destroy
  has_many :rooms, dependent: :destroy

  # adjoining rooms
  belongs_to :north_room_template, class_name: "RoomTemplate", optional: true
  belongs_to :east_room_template, class_name: "RoomTemplate", optional: true
  belongs_to :south_room_template, class_name: "RoomTemplate", optional: true
  belongs_to :west_room_template, class_name: "RoomTemplate", optional: true
  # going from one floor to another
  belongs_to :above_room_template, class_name: "RoomTemplate", optional: true
  belongs_to :below_room_template, class_name: "RoomTemplate", optional: true
end
