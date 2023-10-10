class BasicAttack
  attr_reader :attacker, :defender

  BASIC_ATTACK_BASE_POWER = 40.0

  def initialize(attacker:, defender:)
    @attacker = attacker
    @defender = defender
  end

  def execute
    return if attacker.defeated?

    defender.update!(current_hp: defender.current_hp - damage)
    damage.to_i
  end

  private

  def damage
    # level 5 attacker with 15 attack
    # defender has 5 defense
    # ((40 * (2 + 2) * 2.5) / 50) + 2 = 10
    (((BASIC_ATTACK_BASE_POWER * (level_damage + 2.0) * attacker_v_defender_multiplier) / 50.0) + 2.0).round
  end

  def level_damage
    (2.0 * attacker.level.to_f) / 5.0
  end

  def attacker_v_defender_multiplier
    attacker.attack.to_f / defender.defense
  end
end
