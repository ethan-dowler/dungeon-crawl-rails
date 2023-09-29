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

monster_template_rat =
  MonsterTemplate.create!(
    name: "Savage Rat",
    base_hp: 20,
    base_attack: 10,
    base_defense: 6,
  )
monster_rat =
  Monster.create!(
    monster_template: monster_template_rat,
    level: 3,
    current_room: middle_room
  )

# Characters
warrior =
  Character.create!(
    name: "Warrior",
    level: 5,
    base_hp: 100,
    base_attack: 15,
    base_defense: 12,
  )
