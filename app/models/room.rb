class Room < ApplicationRecord
  belongs_to :floor
  belongs_to :north_room, class_name: "Room", optional: true
  belongs_to :east_room, class_name: "Room", optional: true
  belongs_to :south_room, class_name: "Room", optional: true
  belongs_to :west_room, class_name: "Room", optional: true
  belongs_to :above_room, class_name: "Room", optional: true
  belongs_to :below_room, class_name: "Room", optional: true

  has_many :monsters, foreign_key: :current_room

  scope :entrances, -> { where(entrance: true) }
  scope :exits, -> { where(exit: true) }
  scope :no_outlet, -> { where(entrance: false, exit: false) }
end
