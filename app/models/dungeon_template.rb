class DungeonTemplate < ApplicationRecord
  has_many :dungeons, dependent: :destroy
end
