class SaveFile < ApplicationRecord
  belongs_to :location, class_name: "Tile", optional: true
  has_many :player_characters, dependent: :destroy
  has_many :maps, dependent: :destroy
  has_many :event_logs, dependent: :destroy
  has_many :items, as: :owner, dependent: :destroy

  def log(message)
    event_logs.create!(message:)
  end
end
