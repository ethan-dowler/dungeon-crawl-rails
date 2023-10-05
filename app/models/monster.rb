class Monster < ApplicationRecord
  include Conditionable
  include Modifiable
  include HasHp

  belongs_to :monster_template
  has_many :item_drops, through: :monster_template

  belongs_to :current_room, class_name: 'Room'
  has_one :dungeon, through: :current_room

  delegate :name, :base_hp, :base_attack, :base_defense, to: :monster_template

  def max_hp = total(:hp)
  def attack = total(:attack)
  def defense = total(:defense)
end
