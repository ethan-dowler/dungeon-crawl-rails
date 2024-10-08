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
    description: "A man-sized rodent with bloodshot eyes, vicious claws, bulging veins, and oversized teeth. Doesn't seem natural...",
    level: 3,
    base_hp: 25,
    base_damage_rating: 4,
    base_armor_rating: 0,
    base_speed_rating: 70,
    base_experience_yield: 10
  )

giant_rat.drops.create!(item_template: coin, percent_chance: 70)
giant_rat.drops.create!(item_template: rat_tooth, percent_chance: 20)
giant_rat.drops.create!(item_template: rat_tail, percent_chance: 5)

# It gets worse...
festering_rat =
  NpcTemplate.create!(
    name: "Festering Rat",
    description: "A fat, lumbering rodent covered in oozing boils that leak blood and dark sludge. Definitely not natural...",
    level: 6,
    base_hp: 60,
    base_damage_rating: 8,
    base_armor_rating: 10,
    base_speed_rating: 20,
    base_experience_yield: 25
  )

festering_rat.drops.create!(item_template: coin, percent_chance: 80)
festering_rat.drops.create!(item_template: rat_tooth, percent_chance: 35)
festering_rat.drops.create!(item_template: rat_tail, percent_chance: 15)

# WTF?!
rat_king =
  NpcTemplate.create!(
    name: "Rat King",
    description: "A savage, bi-pedal rodent with arms like bat wings and a tail like a scorpion. Metal spikes pierce its head to form a makeshift crown. What darkness begot this monster?",
    level: 10,
    base_hp: 100,
    base_damage_rating: 15,
    base_armor_rating: 25,
    base_speed_rating: 100,
    base_experience_yield: 175
  )
5.times { rat_king.drops.create!(item_template: coin, percent_chance: 90) }
rat_king.drops.create!(item_template: rat_tooth, percent_chance: 50)
rat_king.drops.create!(item_template: rat_tail, percent_chance: 80)
rat_king.drops.create!(item_template: rat_crown)
