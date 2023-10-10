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
    raise 'Invalid stat' unless respond_to?(:"base_#{stat}")

    ((send(:"base_#{stat}") + flat_modifier_for(stat)) * percent_modifier_for(stat)).round
  end

  def poke_total(stat)
    return poke_hp_total if stat.to_sym == :hp

    (((total_base(stat) * level_multiplier).floor + 5.00) * percent_modifier_for(stat)).floor
  end

  def poke_hp_total
    (((total_base(:hp) * level_multiplier).floor + level + 10) * percent_modifier_for(:hp)).floor
  end

  private

  def total_base(stat) = (2.0 * send(:"base_#{stat}")) + flat_modifier_for(stat)

  def level_multiplier = level / 100.0
end
