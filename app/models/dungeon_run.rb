class DungeonRun < ApplicationRecord
  belongs_to :character
  belongs_to :dungeon
  belongs_to :current_room, class_name: 'Room'

  scope :active, -> { where(completed_at: nil) }

  before_validation :ensure_current_room, :ensure_started_at, only: :create

  def end_run
    update!(
      completed_at: DateTime.current,
      completed_reason: CompletedReason::COMPLETED
    )
  end

  private

  def ensure_current_room
    return if current_room.present?

    self.current_room = dungeon.entrance
  end

  def ensure_started_at
    return if started_at.present?

    self.started_at = DateTime.current
  end

  module CompletedReason
    COMPLETED = 'COMPLETED'.freeze
    RETIRED = 'RETIRED'.freeze
    DIED = 'DIED'.freeze
  end
end
