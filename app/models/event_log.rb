class EventLog < ApplicationRecord
  belongs_to :dungeon_run

  def self.recent
    order(created_at: :desc).first(10)
  end
end
