# must implement level and any number of base_* stats
module Modifiable
  extend ActiveSupport::Concern

  included do
    has_many :modifiers, as: :target, dependent: :destroy, after_add: :recalc, after_remove: :recalc
  end

  def flat_modifier_for(stat)
    modifiers.flat.where(stat:).sum(:value)
  end

  def percent_modifier_for(stat)
    1.0 + (modifiers.percent.where(stat:).sum(:value).to_f / 100.0)
  end

  def recalc(modifier)
    return unless %w[Character Monster].include?(modifier.target_type)

    recalc_max_hp(modifier.target)
    recalc_speed_factor(modifier.target)
    recalc_armor_rating(modifier.target)
    recalc_damage_rating(modifier.target)
  end

  private

  def level_multiplier = level / 50.0

  def recalc_max_hp(target)
    return unless target.respond_to?(:max_hp)

    target.update!(
      max_hp: ((target.base_hp + flat_modifier_for(:max_hp)) * percent_modifier_for(:max_hp)).floor
    )
  end

  def recalc_speed_factor(target)
    return unless target.respond_to?(:speed_factor)

    target.update!(
      speed_factor: (
        (target.base_speed_factor + flat_modifier_for(:speed_factor)) * percent_modifier_for(:speed_factor)
      ).floor
    )
  end

  def recalc_armor_rating(target)
    return unless target.respond_to?(:armor_rating)

    target.update!(armor_rating: flat_modifier_for(:armor_rating) * percent_modifier_for(:armor_rating))
  end

  def recalc_damage_rating(target)
    return unless target.respond_to?(:damage_rating)

    target.update!(damage_rating: flat_modifier_for(:damage_rating) * percent_modifier_for(:damage_rating))
  end
end
