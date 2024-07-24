# Loot!
coin =
  Item.create!(
    name: "Coin",
    description: "A simple golden disc of unkown value and origin.",
    stackable: true,
    value: 3
  )
rat_tooth =
  Item.create!(
    name: "Rat Tooth",
    description: "Jagged, sharp, and painful!",
    stackable: true,
    value: 5
  )
rat_tail =
  Item.create!(
    name: "Rat Tail",
    description: "A delicacy for those who know how to cook it.",
    stackable: true,
    value: 50
  )
rat_crown =
  Item.create!(
    name: "Rat Crown",
    description: "A gangly, rusted crown with spikes going in every direction.",
    stackable: false,
    value: 250
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

rat_king =
  MonsterTemplate.create!(
    name: "Rat King",
    base_hp: 120,
    base_attack: 40,
    base_defense: 25,
    base_speed: 120,
    base_experience_yield: 250
  )
rat_king.drops.create!(item: rat_crown)
