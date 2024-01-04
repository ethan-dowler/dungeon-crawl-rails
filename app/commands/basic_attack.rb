class BasicAttack
  attr_reader :dungeon_run, :attacker, :defender

  BASIC_ATTACK_BASE_POWER = 40.0

  def initialize(dungeon_run:, attacker:, defender:)
    @dungeon_run = dungeon_run
    @attacker = attacker
    @defender = defender
  end

  def execute
    return if cant_attack?

    defender.update!(current_hp: defender.current_hp - damage)

    log_damage
  end

  private

  def cant_attack? = attacker.defeated? || defender.defeated?

  def log_damage
    dungeon_run.log("#{attacker_name} attacked #{defender_name} and dealt #{damage} damage.")
  end

  # TODO: move the damage calculation to its own class. Will need to reuse for other attacks
  def damage
    @damage ||= (
      ((BASIC_ATTACK_BASE_POWER * (level_damage + 2.0) * attacker_v_defender_multiplier) / 50.0) + 2.0
    ).round
  end

  def level_damage
    (2.0 * attacker.level.to_f) / 5.0
  end

  def attacker_v_defender_multiplier
    attacker.attack.to_f / defender.defense
  end

  def attacker_name
    @attacker_name ||= dungeon_run.character_id == attacker.id ? "You" : attacker.name
  end

  def defender_name
    @defender_name ||= dungeon_run.character_id == defender.id ? "you" : defender.name
  end
end
