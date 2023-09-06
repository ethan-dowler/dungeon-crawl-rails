class Room < ApplicationRecord
  belongs_to :dungeon
  belongs_to :north_room, class_name: "Room", optional: true
  belongs_to :east_room, class_name: "Room", optional: true
  belongs_to :south_room, class_name: "Room", optional: true
  belongs_to :west_room, class_name: "Room", optional: true
end
