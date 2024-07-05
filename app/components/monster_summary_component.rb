class MonsterSummaryComponent < ApplicationComponent
  attr_reader :monster, :dungeon_run

  def initialize(monster:, dungeon_run:)
    @monster = monster
    @dungeon_run = dungeon_run
  end

  def name_and_level = "#{monster.name} Lvl. #{monster.level}"
end
