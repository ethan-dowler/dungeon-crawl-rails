class SaveFile < ApplicationRecord
  belongs_to :location, class_name: "Tile", optional: true
  has_many :player_characters
end
