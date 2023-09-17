class Character < ApplicationRecord
  include Modifiable

  has_many :modifiers, as: :source
  has_many :dungeon_runs

  # total value
  def max_hp = ((base_hp + hp_flat_modifier) * hp_percent_modifier).round
  def attack = ((base_attack + attack_flat_modifier) * attack_percent_modifier).round
  def defense = ((base_defense + defense_flat_modifier) * defense_percent_modifier).round
end
