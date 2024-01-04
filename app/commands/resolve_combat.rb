class ResolveCombat
  attr_reader :character, :monster

  def initialize(character:, monster:)
    @character = character
    @monster = monster
  end

  def execute
    DungeonRun.transaction do
      check_monster_death
      check_player_death
    end
  end

  private

  def check_monster_death
    return unless monster.defeated?

    character.current_run.log("You defeated #{monster.name}.")
    GainCombatXp.new(character:, monster:).execute
  end

  def check_player_death
    return unless character.defeated? && character.current_run.present?

    character.current_run.log("#{monster.name} defeated you. Your run is over.")
    EndRun.new(dungeon_run: character.current_run, ended_reason: DungeonRun::EndedReason::DEFEATED).execute
  end
end
