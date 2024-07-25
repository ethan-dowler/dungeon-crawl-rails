class RoomEncounter < ApplicationRecord
  belongs_to :room_template
  belongs_to :monster_template
end
