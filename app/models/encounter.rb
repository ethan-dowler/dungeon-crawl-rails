class Encounter < ApplicationRecord
  belongs_to :tile_template
  belongs_to :npc_template
end
