raise 'Cannot run seeds more than once. Use db:seed:replant to start over.' if DungeonTemplate.exists?

dungeon_template =
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
    base_hp: 20,
    base_attack: 10,
    base_defense: 6,
    base_experience_yield: 50
  )
monster_template_rat.item_drops.create!(item: coin, odds: 1)

# Characters
Character.create!(
  name: 'Warrior',
  level: 5,
  xp: 64,
  base_hp: 100,
  base_attack: 15,
  base_defense: 12
)
