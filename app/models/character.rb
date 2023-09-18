class Character < ApplicationRecord
  include Modifiable

  has_many :dungeon_runs

  def max_hp = total(:hp)
  def attack = total(:attack)
  def defense = total(:defense)
end
