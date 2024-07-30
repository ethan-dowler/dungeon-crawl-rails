class MapTemplate < ApplicationRecord
  has_many :maps, dependent: :destroy
  has_many :tile_templates, dependent: :destroy
end
