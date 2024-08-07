class NavigationComponent < ApplicationComponent
  attr_reader :tile

  LINK_TEXT = {
    north: "N",
    east: "E",
    south: "S",
    west: "W",
    above: "Up",
    below: "Down"
  }.freeze

  def initialize(tile)
    @tile = tile
  end

  def adjacent_tiles
    @adjacent_tiles ||= {
      north: north_tile,
      east: east_tile,
      south: south_tile,
      west: west_tile,
      above: above_tile,
      below: below_tile
    }.filter { |_k, v| v.present? }
  end

  def north_tile
    @north_tile ||= tile.map.find_tile(x: tile.x, y: tile.y + 1, z: tile.z)
  end

  def east_tile
    @east_tile ||= tile.map.find_tile(x: tile.x + 1, y: tile.y, z: tile.z)
  end

  def south_tile
    @south_tile ||= tile.map.find_tile(x: tile.x, y: tile.y - 1, z: tile.z)
  end

  def west_tile
    @west_tile ||= tile.map.find_tile(x: tile.x - 1, y: tile.y, z: tile.z)
  end

  def above_tile
    @above_tile ||= tile.map.find_tile(x: tile.x, y: tile.y, z: tile.z + 1)
  end

  def below_tile
    @below_tile ||= tile.map.find_tile(x: tile.x, y: tile.y, z: tile.z - 1)
  end
end
