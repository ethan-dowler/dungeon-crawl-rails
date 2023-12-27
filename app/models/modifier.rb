class Modifier < ApplicationRecord
  belongs_to :source, polymorphic: true
  belongs_to :target, polymorphic: true

  before_validation :set_default_source, only: :create

  # specific modifier types
  scope :flat, -> { where(modifier_type: Type::FLAT) }
  scope :percent, -> { where(modifier_type: Type::PERCENT) }

  # specific stats
  scope :hp, -> { where(stat: Stat::HP) }
  scope :attack, -> { where(stat: Stat::ATTACK) }
  scope :defense, -> { where(stat: Stat::DEFENSE) }
  scope :speed, -> { where(stat: Stat::SPEED) }
  scope :spirit, -> { where(stat: Stat::SPIRIT) }
  scope :wisdom, -> { where(stat: Stat::WISDOM) }

  def flat? = modifier_type == Type::FLAT
  def percent? = modifier_type == Type::PERCENT

  private

  def set_default_source
    return if source.present?

    self.source_id = target_id
    self.source_type = target_type
  end

  module Type
    FLAT = "flat".freeze
    PERCENT = "percent".freeze
  end
end
