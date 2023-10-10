class FloorEncounter < ApplicationRecord
  belongs_to :floor
  belongs_to :monster_template

  def level_range
    level_range_start..level_range_end
  end
end
