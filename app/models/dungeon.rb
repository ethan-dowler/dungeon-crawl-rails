class Dungeon < ApplicationRecord
  belongs_to :dungeon_template

  has_many :floors, dependent: :destroy
  has_many :rooms, through: :floors

  delegate :name, to: :dungeon_template

  def entrance
    return nil if first_floor.nil?

    first_floor.rooms.entrances.first
  end

  def first_floor
    @first_floor ||= floors.find_by(level: 1)
  end
end
