class Character < ApplicationRecord
  has_many :modifiers
  has_many :dungeon_runs

  def max_hp = (base_hp * hp_modifier).round
  def attack = (base_attack * attack_modifier).round
  def defense = (base_defense * defense_modifier).round
        
  def hp_modifier = modifier_for(:hp)
  def attack_modifier = modifier_for(:attack)
  def defense_modifier = modifier_for(:defense)

private

  def modifier_for(stat)
    1.0 + (modifiers.send(stat).sum(&:value).to_f / 100.0)
  end
end
