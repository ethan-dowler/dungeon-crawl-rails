class DungeonRunSummaryComponent < ViewComponent::Base
  attr_reader :dungeon_run

  def initialize(dungeon_run)
    @dungeon_run = dungeon_run
  end

  def floor_level = dungeon_run.current_room.floor.level
  def room_name = dungeon_run.current_room.name
end
