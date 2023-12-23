# Loot!
coin =
  Item.create!(
    name: 'Coin',
    description: 'A simple golden disc of unkown value and origin.',
    stackable: true
  )
tooth =
  Item.create!(
    name: 'Rat tooth',
    description: 'Jagged, sharp, and painful!'
  )

# Yup... the bane of every young adventurer...
giant_rat =
  MonsterTemplate.create!(
    name: 'Giant Rat',
    base_hp: 40,
    base_attack: 20,
    base_defense: 20,
    base_speed: 90,
    base_experience_yield: 50
  )

giant_rat.drops.create!(item: coin, percent_chance: 70)
giant_rat.drops.create!(item: tooth, percent_chance: 20)
