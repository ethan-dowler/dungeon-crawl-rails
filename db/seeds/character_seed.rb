# base attributes should total 12 for starter characters

save_file = SaveFile.first

# TODO: allow user to generate custom character
PlayerCharacter.create!(
  save_file:,
  name: "Rockbiter",
  body: 5,
  mind: 3,
  spirit: 4
)

PlayerCharacter.create!(
  save_file:,
  name: "Araknythrae",
  body: 4,
  mind: 5,
  spirit: 3
)

PlayerCharacter.create!(
  save_file:,
  name: "Kel",
  body: 4,
  mind: 4,
  spirit: 4
)

PlayerCharacter.create!(
  save_file:,
  name: "Darkling",
  body: 3,
  mind: 4,
  spirit: 5
)
