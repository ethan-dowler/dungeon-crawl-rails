class Room < ApplicationRecord
  belongs_to :floor
  belongs_to :north_room, class_name: "Room", optional: true
  belongs_to :east_room, class_name: "Room", optional: true
  belongs_to :south_room, class_name: "Room", optional: true
  belongs_to :west_room, class_name: "Room", optional: true
  belongs_to :above_room, class_name: "Room", optional: true
  belongs_to :below_room, class_name: "Room", optional: true

  scope :entrance, -> { where(entrance: true) }
end
