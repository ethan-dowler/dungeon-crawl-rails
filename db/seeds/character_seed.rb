# base attributes should total 15 for starter characters

save_file = SaveFile.create!(name: "Omega Squad")

# TODO: allow user to generate custom character
PlayerCharacter.create!(
  save_file:,
  name: "Guardian",
  body: 5,
  mind: 4,
  spirit: 6
)

PlayerCharacter.create!(
  save_file:,
  name: "Blade Dancer",
  body: 6,
  mind: 5,
  spirit: 4
)

PlayerCharacter.create!(
  save_file:,
  name: "Arcanist",
  body: 4,
  mind: 6,
  spirit: 5
)
