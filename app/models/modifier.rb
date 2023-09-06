class Modifier < ApplicationRecord
  belongs_to :character

  scope :hp, -> { where(stat: :hp) }
  scope :attack, -> { where(stat: :attack) }
  scope :defense, -> { where(stat: :defense) }
end
