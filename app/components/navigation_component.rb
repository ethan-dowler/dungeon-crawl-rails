class NavigationComponent < ApplicationComponent
  POSSIBLE_DIRECTIONS = %w[north east south west above below].freeze

  attr_reader :dungeon_run

  def initialize(dungeon_run)
    @dungeon_run = dungeon_run
  end

  def direction_text(direction)
    case direction
    when Dungeon::Direction::ABOVE
      "Up"
    when Dungeon::Direction::BELOW
      "Down"
    else
      direction.titleize
    end
  end
end
