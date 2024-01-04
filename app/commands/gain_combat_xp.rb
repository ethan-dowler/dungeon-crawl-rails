class GainCombatXp
  attr_reader :character, :monster

  def initialize(character:, monster:)
    @character = character
    @monster = monster
  end

  def execute
    Character.transaction do
      character.current_run.log("You gained #{xp_to_gain} XP.")
      character.update!(xp: character.xp + xp_to_gain)
    end
  end

  private

  def xp_to_gain
    @xp_to_gain ||=
      begin
        raw_xp = ((monster.base_experience_yield * monster.level.to_f) / 7.0).round
        # cut xp in half if 5 or more levels above monster
        overleveled? ? raw_xp / 2 : raw_xp
      end
  end

  def overleveled?
    (character.level - monster.level) >= 5
  end
end
