## item traits
dual_wield_trait = Trait.create!(
  name: Trait::Weapon::DUAL_WIELD,
  explanation: "May equip two primaries with dual-wield."
)
two_handed_trait = Trait.create!(
  name: Trait::Weapon::TWO_HANDED,
  explanation: "May not equip a secondary."
)

## primaries

# martial
rusty_dagger =
  ItemTemplate.primary.create!(
    name: "Rusty Dagger",
    description: "It's seen better days..."
  )
rusty_dagger.personality_traits.create!(trait: dual_wield_trait)
rusty_dagger.modifiers.flat.damage_rating.create!(value: 4)

rusty_short_sword =
  ItemTemplate.primary.create!(
    name: "Rusty Short Sword",
    description: "It's seen better days..."
  )
rusty_short_sword.personality_traits.create!(trait: dual_wield_trait)
rusty_short_sword.modifiers.flat.damage_rating.create!(value: 6)

rusty_long_sword =
  ItemTemplate.primary.create!(
    name: "Rusty Long Sword",
    description: "It's seen better days..."
  )
rusty_long_sword.modifiers.flat.damage_rating.create!(value: 8)

rusty_great_sword =
  ItemTemplate.primary.create!(
    name: "Rusty Greatsword",
    description: "It's seen better days..."
  )
rusty_great_sword.personality_traits.create!(trait: two_handed_trait)
rusty_great_sword.modifiers.flat.damage_rating.create!(value: 14)

# TODO: add flowcasting
# # magical
# apprentice_wand =
#   ItemTemplate.primary.create!(
#     name: "Apprentice Wand",
#     description: "Flimsy wand for beginners."
#   )
# apprentice_wand.personality_traits.create!(trait: dual_wield_trait)
# apprentice_wand.modifiers.flat.spirit.create!(value: 2)
# apprentice_wand.modifiers.flat.speed_rating.create!(value: 1)

# apprentice_spellbook =
#   ItemTemplate.primary.create!(
#     name: "Apprentice Spellbook",
#     description: "Magic energy ripples from its pages."
#   )
# apprentice_spellbook.modifiers.flat.spirit.create!(value: 5)

# apprentice_staff =
#   ItemTemplate.primary.create!(
#     name: "Apprentice Staff",
#     description: "Rugged staff for beginners"
#   )
# apprentice_staff.personality_traits.create!(trait: two_handed_trait)
# apprentice_staff.modifiers.flat.spirit.create!(value: 8)
# apprentice_staff.modifiers.flat.damage_rating.create!(value: 2)
# apprentice_staff.modifiers.flat.speed_rating.create!(value: -2)

## secondaries
small_shield =
  ItemTemplate.secondary.create!(
    name: "Small Shield",
    description: "Won't block much but might save your life."
  )
small_shield.modifiers.flat.armor_rating.create!(value: 10)
# TODO: add small chance (5%-10%) to block all damage
# small_shield.modifiers.flat.evade_rating.create!(value: 10)

# TODO: add flowcasting
# small_candle =
#   ItemTemplate.secondary.create!(
#     name: "Small Candle",
#     description: "Emits a dim light."
#   )
# small_candle.modifiers.flat.wisdom.create!(value: 4)

## armor
weak_leather =
  ItemTemplate.armor.create!(
    name: "Dusty Leather",
    description: "Full of rips and tears."
  )
weak_leather.modifiers.flat.armor_rating.create!(value: 10)
weak_leather.modifiers.flat.speed_rating.create!(value: -10)

rusty_mail =
  ItemTemplate.armor.create!(
    name: "Rusty Mail",
    description: "Full of dents and scratches."
  )
rusty_mail.modifiers.flat.armor_rating.create!(value: 20)
rusty_mail.modifiers.flat.speed_rating.create!(value: -20)

# TODO: add flowcasting
# apprentice_robes =
#   ItemTemplate.armor.create!(
#     name: "Apprentice Robes",
#     description: "Strips of thin cloth stiched together."
#   )
# apprentice_robes.modifiers.flat.wisdom.create!(value: 4)
