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
    raw = (2.0 * send(:"base_#{stat}") * level_multiplier).floor
    minimum_value = stat == :hp ? level + 10.0 : 5.0

    raw + minimum_value
  end

  private

  def level_multiplier = level / 100.0
end
