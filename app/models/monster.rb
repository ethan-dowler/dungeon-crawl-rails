class Monster < ApplicationRecord
  include Conditionable
  include Modifiable
  include HasHp

  belongs_to :monster_template
  belongs_to :current_room, class_name: "Room"

  delegate :base_hp, :base_attack, :base_defense, to: :monster_template

  def max_hp = total(:hp)
end
