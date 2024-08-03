class Map < ApplicationRecord
  belongs_to :save_file
  belongs_to :map_template
  has_many :tiles, dependent: :destroy

  delegate_missing_to :map_template

  def find_tile(x: 0, y: 0, z: 0) # rubocop:disable Naming/MethodParameterName
    tiles.joins(:tile_template).find_by(tile_templates: { x:, y:, z: })
  end
end

# TODO: continue migrating everything from a dungeon-centric approach to a map-centric approach
# in preparation for moving to a full RPG instead of just a dungeon crawler.
