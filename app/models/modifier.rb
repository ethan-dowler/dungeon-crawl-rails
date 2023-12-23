class Modifier < ApplicationRecord
  belongs_to :source, polymorphic: true
  belongs_to :target, polymorphic: true

  # specific modifier types
  scope :flat, -> { where(modifier_type: :flat) }
  scope :percent, -> { where(modifier_type: :percent) }

  # specific stats
  scope :hp, -> { where(stat: :hp) }
  scope :attack, -> { where(stat: :attack) }
  scope :defense, -> { where(stat: :defense) }
  scope :speed, -> { where(stat: :speed) }

  def flat? = modifier_type == Type::FLAT
  def percent? = modifier_type == Type::PERCENT

  module Type
    FLAT = "flat".freeze
    PERCENT = "percent".freeze
  end
end
