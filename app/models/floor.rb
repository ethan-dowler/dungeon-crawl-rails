class Floor < ApplicationRecord
  belongs_to :dungeon
  belongs_to :floor_template

  has_many :rooms, dependent: :destroy

  delegate_missing_to :floor_template
end
