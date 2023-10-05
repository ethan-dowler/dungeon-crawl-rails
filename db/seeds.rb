raise 'Cannot run seeds more than once. Use db:seed:replant to start over.' if DungeonTemplate.exists?

dungeon_template =
  DungeonTemplate.create!(
    name: 'Dungeon One',
    description: 'The very first dungeon'
  )
dungeon_one = dungeon_template.generate_new_dungeon

coin =
  Item.create!(
    name: 'Coin',
    description: 'A simple golden disc of unkown value and origin.'
  )

monster_template_rat =
  MonsterTemplate.create!(
    name: 'Savage Rat',
    base_hp: 20,
    base_attack: 10,
    base_defense: 6
  )
monster_template_rat.item_drops.create!(item: coin)

dungeon_one.rooms.where(entrance: false).find_each do |room|
  # put a giant rat in every room except entrances and exits
  Monster.create!(
    monster_template: monster_template_rat,
    level: 3,
    current_room: room
  )
end

# Characters
Character.create!(
  name: 'Warrior',
  level: 5,
  base_hp: 100,
  base_attack: 15,
  base_defense: 12
)
