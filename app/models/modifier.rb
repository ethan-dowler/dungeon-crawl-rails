class Modifier < ApplicationRecord
  belongs_to :source, polymorphic: true
  belongs_to :target, polymorphic: true

  before_validation :set_default_source, only: :create

  after_save -> { target.recalc }
  after_destroy -> { target.recalc }

  # specific modifier types
  scope :flat, -> { where(modifier_type: Type::FLAT) }
  scope :percent, -> { where(modifier_type: Type::PERCENT) }

  # specific stats
  scope :max_hp, -> { where(stat: :max_hp) }
  scope :speed_rating, -> { where(stat: :speed_rating) }
  scope :armor_rating, -> { where(stat: :armor_rating) }
  scope :damage_rating, -> { where(stat: :damage_rating) }

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
