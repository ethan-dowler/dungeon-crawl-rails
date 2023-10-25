# must implement level and any number of base_* stats
module Modifiable
  extend ActiveSupport::Concern

  included do
    has_many :modifiers, as: :target, dependent: :destroy
  end

  def flat_modifier_for(stat)
    modifiers.flat.where(stat:).sum(&:value)
  end

  def percent_modifier_for(stat)
    1.0 + (modifiers.percent.where(stat:).sum(&:value).to_f / 100.0)
  end

  def total(stat)
    return hp_total if stat.to_sym == :hp

    (((total_base(stat) * level_multiplier).floor + 5.00) * percent_modifier_for(stat)).floor
  end

  def hp_total
    (((total_base(:hp) * level_multiplier).floor + level + 10) * percent_modifier_for(:hp)).floor
  end

  private

  # TODO: figure out better use for flat modifiers
  # OR: rename this flat modifier to "base" modifiers
  #     and add flat mods after level multiplier
  def total_base(stat) = (2.0 * send(:"base_#{stat}")) + flat_modifier_for(stat)

  def level_multiplier = level / 100.0
end
