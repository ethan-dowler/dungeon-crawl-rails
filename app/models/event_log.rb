class EventLog < ApplicationRecord
  belongs_to :save_file

  def self.recent
    order(created_at: :desc).first(10)
  end
end
