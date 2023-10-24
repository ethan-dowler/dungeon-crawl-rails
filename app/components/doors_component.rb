class DoorsComponent < ViewComponent::Base
  CARDINAL_DIRECTIONS = %w[north east south west].freeze
  
  attr_reader :dungeon_run

  def initialize(dungeon_run)
    @dungeon_run = dungeon_run
  end

  def room_above?
    dungeon_run.current_room.above_room.present?
  end

  def room_below?
    dungeon_run.current_room.below_room.present?
  end
end
