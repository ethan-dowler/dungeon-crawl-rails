# must implement level and any number of base_* stats
module Modifiable
  extend ActiveSupport::Concern

  included do
    has_many :modifiers, as: :target, dependent: :destroy
  end

  def flat_modifier_for(stat)
    modifiers.flat.where(stat:).sum(:value)
  end

  def percent_modifier_for(stat)
    1.0 + (modifiers.percent.where(stat:).sum(:value).to_f / 100.0)
  end

  # (raw value * percent mod) + flat mod
  def total(stat)
    ((subtotal(stat) * percent_modifier_for(stat)) + flat_modifier_for(stat)).floor
  end

  def subtotal(stat)
    raw = (send(:"base_#{stat}") * level_multiplier).floor
    static_bonus = stat == :hp ? level + 10.0 : 5.0 # this provides a non-zero minimum value

    raw + static_bonus
  end

  private

  def level_multiplier = level / 50.0
end
