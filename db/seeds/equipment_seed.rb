## item traits
dual_wield_trait = Trait.create!(
  name: Trait::DUAL_WIELD,
  explanation: "May equip two primaries with dual-wield."
)
two_handed_trait = Trait.create!(
  name: Trait::TWO_HANDED,
  explanation: "May not equip a secondary."
)

## primaries

# martial
rusty_dagger =
  Item.primary.create!(
    name: "Rusty Dagger",
    description: "It's seen better days..."
  )
rusty_dagger.personality_traits.create!(trait: dual_wield_trait)
rusty_dagger.modifiers.flat.attack.create!(value: 1)
rusty_dagger.modifiers.flat.speed.create!(value: 3)

rusty_short_sword =
  Item.primary.create!(
    name: "Rusty Short Sword",
    description: "It's seen better days..."
  )
rusty_short_sword.personality_traits.create!(trait: dual_wield_trait)
rusty_short_sword.modifiers.flat.attack.create!(value: 4)
rusty_short_sword.modifiers.flat.speed.create!(value: 1)

rusty_long_sword =
  Item.primary.create!(
    name: "Rusty Long Sword",
    description: "It's seen better days..."
  )
rusty_long_sword.modifiers.flat.attack.create!(value: 6)

rusty_great_sword =
  Item.primary.create!(
    name: "Rusty Greatsword",
    description: "It's seen better days..."
  )
rusty_great_sword.personality_traits.create!(trait: two_handed_trait)
rusty_great_sword.modifiers.flat.attack.create!(value: 11)
rusty_great_sword.modifiers.flat.speed.create!(value: -2)

# magical
apprentice_wand =
  Item.primary.create!(
    name: "Apprentice Wand",
    description: "Flimsy wand for beginners."
  )
apprentice_wand.personality_traits.create!(trait: dual_wield_trait)
apprentice_wand.modifiers.flat.spirit.create!(value: 2)
apprentice_wand.modifiers.flat.speed.create!(value: 1)

apprentice_spellbook =
  Item.primary.create!(
    name: "Apprentice Spellbook",
    description: "Magic energy ripples from its pages."
  )
apprentice_spellbook.modifiers.flat.spirit.create!(value: 5)

apprentice_staff =
  Item.primary.create!(
    name: "Apprentice Staff",
    description: "Rugged staff for beginners"
  )
apprentice_staff.personality_traits.create!(trait: two_handed_trait)
apprentice_staff.modifiers.flat.spirit.create!(value: 8)
apprentice_staff.modifiers.flat.attack.create!(value: 2)
apprentice_staff.modifiers.flat.speed.create!(value: -2)

## secondaries
small_shield =
  Item.secondary.create!(
    name: "Small Shield",
    description: "Won't block much."
  )
small_shield.modifiers.flat.defense.create!(value: 4)

small_candle =
  Item.secondary.create!(
    name: "Small Candle",
    description: "Emits a dim light."
  )
small_candle.modifiers.flat.wisdom.create!(value: 4)

## armor
weak_leather =
  Item.armor.create!(
    name: "Dusty Leather",
    description: "Full of rips and tears."
  )
weak_leather.modifiers.flat.defense.create!(value: 2)

rusty_mail =
  Item.armor.create!(
    name: "Rusty Mail",
    description: "Full of dents and scratches."
  )
rusty_mail.modifiers.flat.defense.create!(value: 8)
rusty_mail.modifiers.flat.speed.create!(value: -4)

apprentice_robes =
  Item.armor.create!(
    name: "Apprentice Robes",
    description: "Strips of thin cloth stiched together."
  )
apprentice_robes.modifiers.flat.hp.create!(value: 1)
apprentice_robes.modifiers.flat.wisdom.create!(value: 4)
