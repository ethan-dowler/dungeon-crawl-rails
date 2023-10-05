class ResolveCombat
  attr_reader :character, :monster

  def initialize(character:, monster:)
    @character = character
    @monster = monster
  end

  def execute
    return unless monster.defeated?

    Monster.transaction do
      GainXp.new(character:, monster:).call
      GainLoot.new(character:, monster:).call
      monster.destroy
    end
  end
end
