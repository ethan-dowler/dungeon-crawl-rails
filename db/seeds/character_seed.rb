# base stats should total 300 for starter characters

Character.create!(
  name: "Guardian",
  level: 5,
  base_hp: 60,
  base_attack: 50,
  base_defense: 60,
  base_speed: 50,
  base_spirit: 40,
  base_wisdom: 40
)

Character.create!(
  name: "Blade Dancer",
  level: 5,
  base_hp: 50,
  base_attack: 60,
  base_defense: 50,
  base_speed: 60,
  base_spirit: 40,
  base_wisdom: 40
)

Character.create!(
  name: "Arcanist",
  level: 5,
  base_hp: 50,
  base_attack: 40,
  base_defense: 40,
  base_speed: 50,
  base_spirit: 60,
  base_wisdom: 60
)
