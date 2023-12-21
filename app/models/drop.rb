class Drop < ApplicationRecord
  belongs_to :item
  belongs_to :monster_template

  validates :percent_chance, presence: true
end
