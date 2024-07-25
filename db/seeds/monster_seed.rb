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
    level: 3,
    max_hp: 25,
    damage_rating: 4,
    armor_rating: 0,
    speed_factor: 80,
    base_experience_yield: 10
  )

giant_rat.drops.create!(item: coin, percent_chance: 70)
giant_rat.drops.create!(item: rat_tooth, percent_chance: 20)
giant_rat.drops.create!(item: rat_tail, percent_chance: 5)

festering_rat =
  MonsterTemplate.create!(
    name: "Festering Rat",
    level: 6,
    max_hp: 60,
    damage_rating: 8,
    armor_rating: 10,
    speed_factor: 90,
    base_experience_yield: 25
  )

festering_rat.drops.create!(item: coin, percent_chance: 80)
festering_rat.drops.create!(item: rat_tooth, percent_chance: 35)
festering_rat.drops.create!(item: rat_tail, percent_chance: 15)

rat_king =
  MonsterTemplate.create!(
    name: "Rat King",
    level: 10,
    max_hp: 100,
    damage_rating: 15,
    armor_rating: 25,
    speed_factor: 100,
    base_experience_yield: 50
  )
5.times { rat_king.drops.create!(item: coin, percent_chance: 90) }
rat_king.drops.create!(item: rat_tooth, percent_chance: 50)
rat_king.drops.create!(item: rat_tail, percent_chance: 80)
rat_king.drops.create!(item: rat_crown)
