class Character < ApplicationRecord
  include Conditionable
  include Modifiable
  include HasHp

  has_many :dungeon_runs

  has_many :equipment_items
  has_many :items, through: :equipment_items

  after_update :check_level_up

  def max_hp = total(:hp)
  def attack = total(:attack)
  def defense = total(:defense)
    
  def xp_to_next_level = level ** 3

private

  def check_level_up
    return unless xp > xp_to_next_level

    update!(level: level + 1)
    check_level_up
  end
end
