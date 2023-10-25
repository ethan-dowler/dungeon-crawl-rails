class GainXp
  attr_reader :character, :monster

  def initialize(character:, monster:)
    @character = character
    @monster = monster
  end

  def execute
    character.update!(xp: character.xp + xp_to_gain)
  end

  private

  def xp_to_gain
    raw_xp = ((monster.base_experience_yield * monster.level.to_f) / 7.0).round
    raw_xp /= 2 if overleveled? # cut xp in half if 5 or more levels above monster
    raw_xp
  end

  def overleveled?
    (character.level - monster.level) >= 5
  end
end
