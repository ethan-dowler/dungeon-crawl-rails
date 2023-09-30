class Monster < ApplicationRecord
  include Conditionable
  include Modifiable
  include HasHp

  belongs_to :monster_template
  belongs_to :current_room, class_name: "Room"
  has_one :dungeon, through: :current_room

  delegate :name, :base_hp, :base_attack, :base_defense, to: :monster_template

  def max_hp = total(:hp)
  def attack = total(:attack)
  def defense = total(:defense)
  
  def defeated? = current_hp <= 0
end
