class NavigationComponent < ApplicationComponent
  attr_reader :tile, :adjacent_tiles

  def initialize(tile)
    @tile = tile
    north_tile = tile.map.find_tile(x: tile.x, y: tile.y + 1, z: tile.z)
    east_tile = tile.map.find_tile(x: tile.x + 1, y: tile.y, z: tile.z)
    south_tile = tile.map.find_tile(x: tile.x, y: tile.y - 1, z: tile.z)
    west_tile = tile.map.find_tile(x: tile.x - 1, y: tile.y, z: tile.z)
    above_tile = tile.map.find_tile(x: tile.x, y: tile.y, z: tile.z + 1)
    below_tile = tile.map.find_tile(x: tile.x, y: tile.y, z: tile.z - 1)
    @adjacent_tiles = {
      north: north_tile,
      east: east_tile,
      south: south_tile,
      west: west_tile,
      above: above_tile,
      below: below_tile
    }.filter { |k,v| v.present? }
  end

  def link_text(direction)
    case direction
    when :north
      "N"
    when :east
      "E"
    when :south
      "S"
    when :west
      "W"
    when :above
      "Up"
    when :below
      "Down"
    end
  end
end
