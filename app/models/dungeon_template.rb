class DungeonTemplate < ApplicationRecord
  has_many :floor_templates, dependent: :destroy
  has_many :dungeons, dependent: :destroy
  belongs_to :entrance_room_template, class_name: "RoomTemplate", optional: true
end
