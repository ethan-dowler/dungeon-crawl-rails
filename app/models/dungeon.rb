class Dungeon < ApplicationRecord
  belongs_to :dungeon_template

  has_many :floors
  has_many :rooms, through: :floors

  def entrance
    return nil if first_floor.nil?

    first_floor.rooms.entrances.first
  end

  def first_floor
    @first_floor ||= floors.find_by(level: 1)
  end
end
