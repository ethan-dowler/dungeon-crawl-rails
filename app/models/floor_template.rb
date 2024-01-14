class FloorTemplate < ApplicationRecord
  belongs_to :dungeon_template
  has_many :room_templates, dependent: :destroy
  has_many :floors, dependent: :destroy
end
