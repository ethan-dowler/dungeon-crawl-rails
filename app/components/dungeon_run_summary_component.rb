class DungeonRunSummaryComponent < ApplicationComponent
  attr_reader :dungeon_run

  def initialize(dungeon_run)
    @dungeon_run = dungeon_run
  end

  def floor_level
    level = dungeon_run.current_room.floor.level
    if level.positive?
      "F#{level}"
    elsif level.negative?
      "B#{level}"
    else
      "G"
    end
  end

  def run_number = "Run ##{dungeon_run.id}"

  def room_name = dungeon_run.current_room.name
end
