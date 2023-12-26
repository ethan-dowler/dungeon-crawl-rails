flexible_trait = Trait.create!(
  name: :flexible,
  explanation: "May equip as primary or secondary."
)
two_handed_trait = Trait.create!(
  name: "two handed",
  explanation: "May not equip a secondary."
)

# TODO: move starting equipment to individual character/class files
rusty_dagger =
  Item.primary.create!(
    name: "Rusty Dagger",
    description: "A dull dagger that's seen better days."
  )
rusty_dagger.personality_traits.create!(trait: flexible_trait)
rusty_dagger.modifiers.create!(
  source: rusty_dagger,
  modifier_type: Modifier::Type::FLAT,
  stat: Stat::ATTACK,
  value: 1
)
rusty_dagger.modifiers.create!(
  source: rusty_dagger,
  modifier_type: Modifier::Type::FLAT,
  stat: Stat::SPEED,
  value: 4
)

rusty_short_sword =
  Item.primary.create!(
    name: "Rusty Sword",
    description: "A dull sword that's seen better days."
  )
rusty_short_sword.modifiers.create!(
  source: rusty_short_sword,
  modifier_type: Modifier::Type::FLAT,
  stat: Stat::ATTACK,
  value: 3
)

rusty_great_sword =
  Item.primary.create!(
    name: "Rusty Greatsword",
    description: "A large, dull sword that's seen better days."
  )
rusty_great_sword.personality_traits.create!(trait: two_handed_trait)
rusty_great_sword.modifiers.create!(
  source: rusty_great_sword,
  modifier_type: Modifier::Type::FLAT,
  stat: Stat::ATTACK,
  value: 5
)
rusty_great_sword.modifiers.create!(
  source: rusty_great_sword,
  modifier_type: Modifier::Type::FLAT,
  stat: Stat::SPEED,
  value: -2
)

small_shield =
  Item.secondary.create!(
    name: "Small Shield",
    description: "A tiny shield that won't block much."
  )
small_shield.modifiers.create!(
  source: small_shield,
  modifier_type: Modifier::Type::FLAT,
  stat: Stat::DEFENSE,
  value: 2
)

weak_leather =
  Item.armor.create!(
    name: "Weak Leather",
    description: "Pitiful armor full of rips and tears."
  )
weak_leather.modifiers.create!(
  source: weak_leather,
  modifier_type: Modifier::Type::FLAT,
  stat: Stat::DEFENSE,
  value: 2
)
