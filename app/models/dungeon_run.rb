class DungeonRun < ApplicationRecord
  belongs_to :character
  belongs_to :dungeon
  belongs_to :current_room, class_name: "Room"

  scope :active, -> { where(completed_at: nil) }

  before_validation :ensure_current_room

  private

  def ensure_current_room
    return if current_room.present?

    self.current_room = dungeon.rooms.entrance.first
  end
end
