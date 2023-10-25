class NavigationComponent < ViewComponent::Base
  POSSIBLE_DIRECTIONS = %i[north east south west above below].freeze

  attr_reader :dungeon_run

  def initialize(dungeon_run)
    @dungeon_run = dungeon_run
  end

  def direction_classes(direction) # rubocop:disable Metrics/MethodLength
    case direction
    when :north
      'top-1 left-1/2 -translate-x-1/2'
    when :east
      'right-2 top-1/2 -translate-y-1/2'
    when :south
      'bottom-1 left-1/2 -translate-x-1/2'
    when :west
      'left-2 top-1/2 -translate-y-1/2'
    when :above, :below
      'top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2'
    else
      ''
    end
  end

  private

  def room_above?
    dungeon_run.current_room.above_room.present?
  end

  def room_below?
    dungeon_run.current_room.below_room.present?
  end
end
