class ResolveCombat
  attr_reader :character, :monster

  def initialize(character:, monster:)
    @character = character
    @monster = monster
  end

  def execute
    DungeonRun.transaction do
      resolve_monster
      resolve_character
    end
  end

  private

  def resolve_monster
    return unless monster.defeated?

    GainXp.new(character:, monster:).execute
  end

  def resolve_character
    return unless character.defeated? && character.current_run.present?

    EndRun.new(dungeon_run: character.current_run, ended_reason: DungeonRun::EndedReason::DEFEATED).execute
  end
end
