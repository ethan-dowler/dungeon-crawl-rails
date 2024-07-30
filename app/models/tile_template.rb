class TileTemplate < ApplicationRecord
  belongs_to :map_template
  has_many :encounters, dependent: :destroy
end
