class MinimapComponent < ApplicationComponent
  MINIMAP_RADIUS = 2

  attr_reader :current_tile

  def initialize(current_tile)
    @current_tile = current_tile
  end

  def tiles
    @tiles ||=
      current_tile.map.tiles.with_coords(
        x: western_boundary..eastern_boundary,
        y: southern_boundary..northern_boundary,
        z: current_tile.z
      )
  end

  def x_coords = (western_boundary..eastern_boundary)
  def y_coords = (southern_boundary..northern_boundary).to_a.reverse

  def western_boundary = (current_tile.x - MINIMAP_RADIUS)
  def eastern_boundary = (current_tile.x + MINIMAP_RADIUS)
  def southern_boundary = (current_tile.y - MINIMAP_RADIUS)
  def northern_boundary = (current_tile.y + MINIMAP_RADIUS)
end
