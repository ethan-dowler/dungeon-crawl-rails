SaveFile.first

# Loot!
coin =
  ItemTemplate.create!(
    name: "Coin",
    description: "A simple golden disc of unkown value and origin.",
    stackable: true,
    value: 3
  )
rat_tooth =
  ItemTemplate.create!(
    name: "Rat Tooth",
    description: "Jagged, sharp, and painful!",
    stackable: true,
    value: 5
  )
rat_tail =
  ItemTemplate.create!(
    name: "Rat Tail",
    description: "A delicacy for those who know how to cook it.",
    stackable: true,
    value: 50
  )
rat_crown =
  ItemTemplate.create!(
    name: "Rat Crown",
    description: "A gangly, rusted crown with spikes going in every direction.",
    stackable: false,
    value: 250
  )

# Yup... the bane of every young adventurer...
giant_rat =
  NpcTemplate.create!(
    name: "Giant Rat",
    level: 3,
    base_hp: 25,
    base_damage_rating: 4,
    base_armor_rating: 0,
    base_speed_rating: 80,
    base_experience_yield: 10
  )

giant_rat.drops.create!(item_template: coin, percent_chance: 70)
giant_rat.drops.create!(item_template: rat_tooth, percent_chance: 20)
giant_rat.drops.create!(item_template: rat_tail, percent_chance: 5)

festering_rat =
  NpcTemplate.create!(
    name: "Festering Rat",
    level: 6,
    base_hp: 60,
    base_damage_rating: 8,
    base_armor_rating: 10,
    base_speed_rating: 90,
    base_experience_yield: 25
  )

festering_rat.drops.create!(item_template: coin, percent_chance: 80)
festering_rat.drops.create!(item_template: rat_tooth, percent_chance: 35)
festering_rat.drops.create!(item_template: rat_tail, percent_chance: 15)

rat_king =
  NpcTemplate.create!(
    name: "Rat King",
    level: 10,
    base_hp: 100,
    base_damage_rating: 15,
    base_armor_rating: 25,
    base_speed_rating: 100,
    base_experience_yield: 50
  )
5.times { rat_king.drops.create!(item_template: coin, percent_chance: 90) }
rat_king.drops.create!(item_template: rat_tooth, percent_chance: 50)
rat_king.drops.create!(item_template: rat_tail, percent_chance: 80)
rat_king.drops.create!(item_template: rat_crown)
