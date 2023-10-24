class DungeonRun < ApplicationRecord
  belongs_to :character
  belongs_to :dungeon
  belongs_to :current_room, class_name: 'Room'

  scope :active, -> { where(completed_at: nil) }
  scope :ended, -> { where.not(completed_at: nil) }

  before_validation :ensure_current_room, :ensure_started_at, only: :create

  def active? = completed_at.nil?
  def ended? = completed_at.present?

  def completed? = ended_reason == EndedReason::COMPLETED
  def died? = ended_reason == EndedReason::DIED

  private

  def ensure_current_room
    return if current_room.present?

    self.current_room = dungeon.entrance_room
  end

  def ensure_started_at
    return if started_at.present?

    self.started_at = DateTime.current
  end

  module EndedReason
    COMPLETED = 'COMPLETED'.freeze
    DIED = 'DIED'.freeze
    ELECTIVE = 'ELECTIVE'.freeze
  end
end
