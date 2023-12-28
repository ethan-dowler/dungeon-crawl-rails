class NavigationComponent < ViewComponent::Base
  POSSIBLE_DIRECTIONS = %w[north east south west above below].freeze

  attr_reader :dungeon_run

  def initialize(dungeon_run)
    @dungeon_run = dungeon_run
  end

  def direction_classes(direction) # rubocop:disable Metrics/MethodLength
    case direction
    when Dungeon::Direction::NORTH
      "top-1 left-1/2 -translate-x-1/2"
    when Dungeon::Direction::EAST
      "right-1 top-1/2 -translate-y-1/2"
    when Dungeon::Direction::SOUTH
      "bottom-1 left-1/2 -translate-x-1/2"
    when Dungeon::Direction::WEST
      "left-1 top-1/2 -translate-y-1/2"
    when Dungeon::Direction::ABOVE, Dungeon::Direction::BELOW
      "top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2"
    else
      ""
    end
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
