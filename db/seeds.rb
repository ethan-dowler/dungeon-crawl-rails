raise 'Cannot run seeds more than once. Use db:seed:replant to start over.' if DungeonTemplate.exists?

DungeonTemplate.create!(
  name: 'Dungeon One',
  description: 'The very first dungeon'
)

# create loot
coin =
  Item.create!(
    name: 'Coin',
    description: 'A simple golden disc of unkown value and origin.',
    stackable: true
  )

monster_template_rat =
  MonsterTemplate.create!(
    name: 'Savage Rat',
    base_hp: 40,
    base_attack: 20,
    base_defense: 20,
    base_speed: 90,
    base_experience_yield: 50
  )
monster_template_rat.item_drops.create!(item: coin, percent_chance: 50)

# Characters
warrior =
  Character.create!(
    name: 'Warrior',
    level: 5,
    base_hp: 60,
    base_attack: 60,
    base_defense: 45,
    base_speed: 55,
    base_spirit: 50,
    base_wisdom: 30
  ) # total 300
rogue =
  Character.create!(
    name: 'Rogue',
    level: 5,
    base_hp: 40,
    base_attack: 70,
    base_defense: 35,
    base_speed: 75,
    base_spirit: 40,
    base_wisdom: 40
  ) # base 300

# add basic weapons & armor
rusty_dagger =
  Item.hands.create!(
    name: 'Rusty Dagger',
    description: "A dagger that's seen better days."
  )
small_shield =
  Item.hands.create!(
    name: 'Small Shield',
    description: "A tiny shield that won't block much."
  )
weak_leather =
  Item.armor.create!(
    name: 'Weak Leather Armor',
    description: 'Pitiful armor full of rips and tears.'
  )

rusty_dagger.modifiers.create!(
  source: rusty_dagger,
  modifier_type: :flat,
  stat: :attack,
  value: 3
)

[warrior, rogue].each do |character|
  2.times { AddInventoryItem.new(owner: character, item: rusty_dagger).execute }
  AddInventoryItem.new(owner: character, item: small_shield).execute
  AddInventoryItem.new(owner: character, item: weak_leather).execute
end
