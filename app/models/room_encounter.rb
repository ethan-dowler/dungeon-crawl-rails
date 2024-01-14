class RoomEncounter < ApplicationRecord
  belongs_to :room_template
  belongs_to :monster_template

  def level_range
    level_range_start..level_range_end
  end
end
