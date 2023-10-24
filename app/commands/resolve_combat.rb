class ResolveCombat
  attr_reader :character, :monster

  def initialize(character:, monster:)
    @character = character
    @monster = monster
  end

  def execute
    resolve_monster
    resolve_character
  end

  private

  def resolve_monster
    return unless monster.defeated?

    Monster.transaction do
      GainXp.new(character:, monster:).execute
      GainLoot.new(character:, monster:).execute
      monster.destroy
    end
  end

  def resolve_character
    return unless character.defeated? && character.current_run.present?

    EndRun.new(dungeon_run: character.current_run, ended_reason: DungeonRun::EndedReason::DIED).execute
  end
end
