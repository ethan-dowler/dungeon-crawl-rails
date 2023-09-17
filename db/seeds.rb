# Maps
level_one = Dungeon.find_or_create_by!(name: "Level One")
level_one.update!(description: "The very first dungeon")
if level_one.rooms.none?
  middle_room = level_one.rooms.create!(name: "Middle Room")
  north_room = level_one.rooms.create!(name: "North Room")
  east_room = level_one.rooms.create!(name: "East Room")
  south_room = level_one.rooms.create!(name: "South Room", entrance: true)
  west_room = level_one.rooms.create!(name: "West Room")

  middle_room.update!(north_room:, east_room:, south_room:, west_room:)
  north_room.update!(south_room: middle_room)
  east_room.update!(west_room: middle_room)
  south_room.update!(north_room: middle_room)
  west_room.update!(east_room: middle_room)
end

# Characters
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
].each do |params|
  char = Character.find_by(name: params[:name])
  next if char.present?

  character = Character.create!(**params)
  character.modifiers.create!(modifier_type: :percent, stat: :hp, value: 10)
end
