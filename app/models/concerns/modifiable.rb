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

  def base_damage_rating = 0
  def base_armor_rating = 0
  def base_speed_rating = 0

  def recalc
    recalc_max_hp
    recalc_damage_rating
    recalc_armor_rating
    recalc_speed_rating
  end

  private

  def recalc_max_hp
    return unless respond_to?(:max_hp) && respond_to?(:base_hp)

    self.max_hp = ((base_hp + flat_modifier_for(:max_hp)) * percent_modifier_for(:max_hp)).round
  end

  def recalc_damage_rating
    return unless respond_to?(:damage_rating)

    self.damage_rating =
      ((base_damage_rating + flat_modifier_for(:damage_rating)) * percent_modifier_for(:damage_rating)).round
  end

  def recalc_armor_rating
    return unless respond_to?(:armor_rating)

    self.armor_rating =
      ((base_armor_rating + flat_modifier_for(:armor_rating)) * percent_modifier_for(:armor_rating)).round
  end

  def recalc_speed_rating
    return unless respond_to?(:speed_rating)

    self.speed_rating =
      ((base_speed_rating + flat_modifier_for(:speed_rating)) * percent_modifier_for(:speed_rating)).round
  end
end
