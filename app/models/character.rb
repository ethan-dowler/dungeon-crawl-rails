class Character < ApplicationRecord
  belongs_to :location, optional: true, class_name: "Room"

  has_many :modifiers

  def attack
    (base_attack * attack_modifier).round
  end

  def attack_modifier
    1.0 + (modifiers.attack.sum(&:value).to_f / 100.0)
  end
end
