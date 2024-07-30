class Drop < ApplicationRecord
  belongs_to :item_template
  belongs_to :npc_template
end
