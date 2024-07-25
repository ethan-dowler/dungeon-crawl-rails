module Modifiable
  extend ActiveSupport::Concern

  included do
    has_many :modifiers, as: :target, dependent: :destroy

    after_save :recalc, if: :core_attribute_changed?
  end

  def flat_modifier_for(stat)
    modifiers.flat.where(stat:).sum(:value)
  end

  def percent_modifier_for(stat)
    1.0 + (modifiers.percent.where(stat:).sum(:value).to_f / 100.0)
  end

  def recalc
    recalc_max_hp
    recalc_speed_factor
    recalc_armor_rating
    recalc_damage_rating
  end

  private

  def core_attribute_changed?
    (respond_to?(:body) && body_previously_changed?) ||
      (respond_to?(:mind) && mind_previously_changed?) ||
      (respond_to?(:spirit) && spirit_previously_changed?)
  end

  def recalc_max_hp
    return unless respond_to?(:max_hp)

    update!(
      max_hp: ((base_hp + flat_modifier_for(:max_hp)) * percent_modifier_for(:max_hp)).floor
    )
  end

  def recalc_speed_factor
    return unless respond_to?(:speed_factor)

    update!(
      speed_factor: (
        (base_speed_factor + flat_modifier_for(:speed_factor)) * percent_modifier_for(:speed_factor)
      ).floor
    )
  end

  def recalc_armor_rating
    return unless respond_to?(:armor_rating)

    update!(armor_rating: flat_modifier_for(:armor_rating) * percent_modifier_for(:armor_rating))
  end

  def recalc_damage_rating
    return unless respond_to?(:damage_rating)

    update!(damage_rating: flat_modifier_for(:damage_rating) * percent_modifier_for(:damage_rating))
  end
end
