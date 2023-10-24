raise 'Cannot run seeds more than once. Use db:seed:replant to start over.' if DungeonTemplate.exists?

DungeonTemplate.create!(
  name: 'Dungeon One',
  description: 'The very first dungeon'
)

coin =
  Item.create!(
    name: 'Coin',
    description: 'A simple golden disc of unkown value and origin.'
  )

monster_template_rat =
  MonsterTemplate.create!(
    name: 'Savage Rat',
    base_hp: 30,
    base_attack: 55,
    base_defense: 35,
    base_speed: 75,
    base_experience_yield: 50
  )
monster_template_rat.item_drops.create!(item: coin, odds: 1)

# Characters
Character.create!(
  name: 'Warrior',
  level: 5,
  base_hp: 50,
  base_attack: 60,
  base_defense: 45,
  base_speed: 55
)
Character.create!(
  name: 'Rogue',
  level: 5,
  base_hp: 40,
  base_attack: 70,
  base_defense: 35,
  base_speed: 75
)
