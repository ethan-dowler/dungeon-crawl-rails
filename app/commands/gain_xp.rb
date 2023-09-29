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
    ((monster.base_experience_yield * monster.level.to_f) / 7.0).round
  end
end
