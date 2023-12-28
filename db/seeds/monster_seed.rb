# Loot!
coin =
  Item.create!(
    name: "Coin",
    description: "A simple golden disc of unkown value and origin.",
    stackable: true
  )
rat_tooth =
  Item.create!(
    name: "Rat Tooth",
    description: "Jagged, sharp, and painful!",
    stackable: true
  )
rat_tail =
  Item.create!(
    name: "Rat Tail",
    description: "A delicacy for those who know how to cook it.",
    stackable: true
  )

# Yup... the bane of every young adventurer...
giant_rat =
  MonsterTemplate.create!(
    name: "Giant Rat",
    base_hp: 40,
    base_attack: 20,
    base_defense: 20,
    base_speed: 90,
    base_experience_yield: 50
  )

giant_rat.drops.create!(item: coin, percent_chance: 80)
giant_rat.drops.create!(item: rat_tooth, percent_chance: 20)
giant_rat.drops.create!(item: rat_tail, percent_chance: 5)
