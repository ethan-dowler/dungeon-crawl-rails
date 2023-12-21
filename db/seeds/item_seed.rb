# TODO: move starting equipment to individual character/class files
rusty_dagger =
  Item.primary.create!(
    name: 'Rusty Dagger',
    description: "A dull dagger that's seen better days.",
    traits: [Item::Trait::DUAL_WIELD]
  )
rusty_dagger.modifiers.create!(
  source: rusty_dagger,
  modifier_type: :flat,
  stat: :attack,
  value: 2
)

small_shield =
  Item.secondary.create!(
    name: 'Small Shield',
    description: "A tiny shield that won't block much."
  )
small_shield.modifiers.create!(
  source: small_shield,
  modifier_type: :flat,
  stat: :defense,
  value: 2
)

weak_leather =
  Item.armor.create!(
    name: 'Weak Leather',
    description: 'Pitiful armor full of rips and tears.'
  )
weak_leather.modifiers.create!(
  source: weak_leather,
  modifier_type: :flat,
  stat: :defense,
  value: 2
)
