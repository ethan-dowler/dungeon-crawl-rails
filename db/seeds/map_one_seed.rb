## Create map

map_template =
  MapTemplate.create!(
    name: "Rodent Ruins",
    description: "A sophisticated network of tunnels discovered beneath the town.",
    start_y: -1
  )

## Create individual tiles
Dir[Rails.root.join("db", "seeds", "01_rodent_ruins", "*")].each do |file|
  YAML.load_file(file).each do |tile|
    map_template.tile_templates.create!(**tile)
  end
end

## Configure monster spawns

# ground floor has weak monsters
giant_rat_template = NpcTemplate.find_by!(name: "Giant Rat")
map_template.tile_templates.where(z: 0).find_each do |tile_template|
  tile_template.encounters.create!(
    npc_template: giant_rat_template,
    percent_chance: 90
  )
end

# first floor has stronger monsters
festering_rat_template = NpcTemplate.find_by!(name: "Festering Rat")
map_template.tile_templates.where(z: 1).find_each do |tile_template|
  tile_template.encounters.create!(
    npc_template: festering_rat_template,
    percent_chance: 80
  )
  tile_template.encounters.create!(
    npc_template: giant_rat_template,
    percent_chance: 40
  )
end

# boss room has boss monster
boss_template = NpcTemplate.find_by!(name: "Rat King")
map_template.tile_templates.find_by(name: "Boss Room")
            .encounters
            .create!(npc_template: boss_template)
