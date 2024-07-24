class BasicAttack
  attr_reader :dungeon_run, :attacker, :defender

  BASIC_ATTACK_BASE_POWER = 40.0

  def initialize(attacker:, defender:, dungeon_run: nil)
    @dungeon_run = dungeon_run
    @attacker = attacker
    @defender = defender
  end

  def execute
    return if cant_attack?

    # TODO: incorporate dodging and critical hits
    defender.update!(current_hp: defender.current_hp - damage)
    return unless dungeon_run.present?

    dungeon_run.log("#{attacker_name} attacked #{defender_name} and dealt #{damage} damage.")
  end

  private

  def cant_attack? = attacker.defeated? || defender.defeated?

  def damage
    @damage ||= calculate_damage
  end

  def calculate_damage
    return 0 if defender.armor_rating >= 100

    (attacker.damage_rating.to_f * (1.0 - (defender.armor_rating.to_f / 100.0))).round
  end

  def attacker_name
    @attacker_name ||= dungeon_run.character == attacker ? "You" : attacker.name
  end

  def defender_name
    @defender_name ||= dungeon_run.character_id == defender.id ? "you" : defender.name
  end
end
