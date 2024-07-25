dungeon_template =
  DungeonTemplate.create!(
    name: "Dungeon One",
    description: "The very first dungeon"
  )

## Ground Floor

ground_floor = dungeon_template.floor_templates.create!(name: "Ground Floor", level: 0)

# create rooms
gf_middle_room = ground_floor.room_templates.create!(name: "Middle Room")
gf_north_room = ground_floor.room_templates.create!(name: "North Room")
gf_east_room = ground_floor.room_templates.create!(name: "East Room")
gf_south_room = ground_floor.room_templates.create!(name: "South Room")
gf_west_room = ground_floor.room_templates.create!(name: "West Room")

# connect rooms
gf_middle_room.update!(
  north_room_template: gf_north_room,
  east_room_template: gf_east_room,
  south_room_template: gf_south_room,
  west_room_template: gf_west_room
)
gf_north_room.update!(south_room_template: gf_middle_room)
gf_east_room.update!(west_room_template: gf_middle_room)
gf_south_room.update!(north_room_template: gf_middle_room)
gf_west_room.update!(east_room_template: gf_middle_room)

## First Floor

floor_one = dungeon_template.floor_templates.create!(name: "First Floor", level: 1)

# create rooms
f1_middle_room = floor_one.room_templates.create!(name: "Middle Room")
f1_north_room = floor_one.room_templates.create!(name: "North Room")
f1_east_room = floor_one.room_templates.create!(name: "East Room")
f1_south_room = floor_one.room_templates.create!(name: "South Room")
f1_west_room = floor_one.room_templates.create!(name: "West Room")

# connect rooms
f1_middle_room.update!(
  north_room_template: f1_north_room,
  east_room_template: f1_east_room,
  south_room_template: f1_south_room,
  west_room_template: f1_west_room
)
f1_north_room.update!(south_room_template: f1_middle_room)
f1_east_room.update!(west_room_template: f1_middle_room)
f1_south_room.update!(north_room_template: f1_middle_room)
f1_west_room.update!(east_room_template: f1_middle_room)

## connect Ground Floor to Floor 1
gf_north_room.update!(above_room_template: f1_south_room)
f1_south_room.update!(below_room_template: gf_north_room)

## Boss floor

boss_floor = dungeon_template.floor_templates.create!(name: "Boss Floor", level: 2)

# create rooms
boss_room = boss_floor.room_templates.create!(name: "Boss Room")

## connect the Floor 1 to Boss Floor
f1_north_room.update!(above_room_template: boss_room)
boss_room.update!(below_room_template: f1_north_room)

# the south room of floor 2 is directly above the north room of floor 1
gf_north_room.update!(above_room_template: f1_south_room)
f1_south_room.update!(below_room_template: gf_north_room)

## Set entrance

# player starts in the south room of the ground floor
dungeon_template.update!(entrance_room_template: gf_south_room)

## Configure monster spawns

# ground floor has weak monsters
giant_rat_template = MonsterTemplate.find_by!(name: "Giant Rat")
ground_floor.room_templates.reload.each do |room_template|
  room_template.room_encounters.create!(
    monster_template: giant_rat_template,
    percent_chance: 90,
  )
end

# first floor has stronger monsters
festering_rat_template = MonsterTemplate.find_by!(name: "Festering Rat")
floor_one.room_templates.reload.each do |room_template|
  room_template.room_encounters.create!(
    monster_template: festering_rat_template,
    percent_chance: 90,
  )
end

# boss room has boss monster
boss_template = MonsterTemplate.find_by!(name: "Rat King")
boss_room.room_encounters.create!(
  monster_template: boss_template,
)
