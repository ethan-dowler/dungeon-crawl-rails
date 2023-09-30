class DungeonTemplate < ApplicationRecord
  has_many :dungeons
  

  # TODO: procedurally generate floors and rooms?
  #       that sounds hard... just add some radomization!
  def generate_new_dungeon
    DungeonTemplate.transaction do
      dungeon = Dungeon.create!(dungeon_template:)
      
      # first floor - create rooms
      floor_one = dungeon.floors.create!(name: "Floor 1", level: 1)
      middle_room = floor_one.rooms.create!(name: "Middle Room")
      north_room = floor_one.rooms.create!(name: "North Room", exit: true)
      east_room = floor_one.rooms.create!(name: "East Room")
      south_room = floor_one.rooms.create!(name: "South Room", entrance: true)
      west_room = floor_one.rooms.create!(name: "West Room")

      # first floor - connect rooms
      middle_room.update!(north_room:, east_room:, south_room:, west_room:)
      north_room.update!(south_room: middle_room)
      east_room.update!(west_room: middle_room)
      south_room.update!(north_room: middle_room)
      west_room.update!(east_room: middle_room)

      # second floor - create rooms
      floor_two = dungeon.floors.create!(name: "Floor 2", level: 2)
      middle_room = floor_two.rooms.create!(name: "Middle Room")
      north_room = floor_two.rooms.create!(name: "North Room")
      east_room = floor_two.rooms.create!(name: "East Room")
      south_room = floor_two.rooms.create!(name: "South Room", exit: true)
      west_room = floor_two.rooms.create!(name: "West Room", entrance: true)

      # second floor - connect rooms
      middle_room.update!(north_room:, east_room:, south_room:, west_room:)
      north_room.update!(south_room: middle_room)
      east_room.update!(west_room: middle_room)
      south_room.update!(north_room: middle_room)
      west_room.update!(east_room: middle_room)

      # return a brand new dungeon!
      dungeon
    end
  end
end
