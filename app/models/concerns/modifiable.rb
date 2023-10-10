module Modifiable
  extend ActiveSupport::Concern

  included do
    has_many :modifiers, as: :target, dependent: :destroy
  end

  def flat_modifier_for(stat)
    modifiers.flat.send(stat).sum(&:value)
  end

  def percent_modifier_for(stat)
    1.0 + (modifiers.percent.send(stat).sum(&:value).to_f / 100.0)
  end

  def total(stat)
    raise "Invalid stat" unless respond_to?(:"base_#{stat}")

    ((send(:"base_#{stat}") + flat_modifier_for(stat)) * percent_modifier_for(stat)).round
  end

  def poke_total(stat)
    
  end
end
