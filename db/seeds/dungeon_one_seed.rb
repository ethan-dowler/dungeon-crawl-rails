map =
  MapTemplate.create!(
    name: "Stone Ruins",
    description: "Ruins of an old stone building infested with rats!",
    start_y: -1
  )

# Ground floor
map.tile_templates.create!(name: "Center Room - Ground Floor", x: 0, y: 0, z: 0)
map.tile_templates.create!(name: "North Room - Ground Floor", x: 0, y: 1, z: 0)
map.tile_templates.create!(name: "East Room - Ground Floor", x: 1, y: 0, z: 0)
map.tile_templates.create!(name: "South Room - Ground Floor", x: 0, y: -1, z: 0)
map.tile_templates.create!(name: "West Room - Ground Floor", x: -1, y: 0, z: 0)

## First Floor
map.tile_templates.create!(name: "Center Room - First Floor", x: 0, y: 0, z: 1)
map.tile_templates.create!(name: "North Room - First Floor", x: 0, y: 1, z: 1)
map.tile_templates.create!(name: "East Room - First Floor", x: 1, y: 0, z: 1)
map.tile_templates.create!(name: "South Room - First Floor", x: 0, y: -1, z: 1)
map.tile_templates.create!(name: "West Room - First Floor", x: -1, y: 0, z: 1)

## Boss floor
map.tile_templates.create!(name: "South Room - First Floor", x: 0, y: -1, z: 2)
map.tile_templates.create!(name: "Boss Room", x: 0, y: 0, z: 2)

## Configure monster spawns

# ground floor has weak monsters
giant_rat_template = NpcTemplate.find_by!(name: "Giant Rat")
map.tile_templates.where(z: 0).find_each do |tile_template|
  tile_template.encounters.create!(
    npc_template: giant_rat_template,
    percent_chance: 90
  )
end

# first floor has stronger monsters
festering_rat_template = NpcTemplate.find_by!(name: "Festering Rat")
map.tile_templates.where(z: 1).find_each do |tile_template|
  tile_template.encounters.create!(
    npc_template: festering_rat_template,
    percent_chance: 90
  )
end

# boss room has boss monster
boss_template = NpcTemplate.find_by!(name: "Rat King")
map.tile_templates.find_by(name: "Boss Room")
   .encounters
   .create!(npc_template: boss_template)
