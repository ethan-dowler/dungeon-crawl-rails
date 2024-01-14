class Drop < ApplicationRecord
  belongs_to :item
  belongs_to :monster_template
end
