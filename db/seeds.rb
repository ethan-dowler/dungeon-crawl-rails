# Maps
return if Dungeon.exists?

dungeon_one = Dungeon.create!(name: "Dungeon One", description: "The very first dungeon")

floor_one = dungeon_one.floors.create!(name: "Floor 1", level: 1)

middle_room = floor_one.rooms.create!(name: "Middle Room")
north_room = floor_one.rooms.create!(name: "North Room", exit: true)
east_room = floor_one.rooms.create!(name: "East Room")
south_room = floor_one.rooms.create!(name: "South Room", entrance: true)
west_room = floor_one.rooms.create!(name: "West Room")

middle_room.update!(north_room:, east_room:, south_room:, west_room:)
north_room.update!(south_room: middle_room)
east_room.update!(west_room: middle_room)
south_room.update!(north_room: middle_room)
west_room.update!(east_room: middle_room)


# Characters
character_params =
  [
    {
      name: "Knight",
      level: 1,
      base_hp: 100,
      current_hp: 100,
      base_attack: 15,
      base_defense: 12,
    },
    {
      name: "Peasant",
      level: 1,
      base_hp: 60,
      current_hp: 60,
      base_attack: 6,
      base_defense: 2,
    },
    {
      name: "Barbarian",
      level: 1,
      base_hp: 120,
      current_hp: 120,
      base_attack: 22,
      base_defense: 8,
    }
  ]

character_params.each { Character.create!(**_1) }
