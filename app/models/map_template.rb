class MapTemplate < ApplicationRecord
  has_many :maps, dependent: :destroy
  has_many :tile_templates, dependent: :destroy

  def generate_instance(save_file:)
    map = Map.create!(save_file:, map_template: self)
    tile_templates.each do |tile_template|
      tile = map.tiles.create!(tile_template:)
      tile.roll_for_encounters.each(&:save!)
    end
    map
  end
end
