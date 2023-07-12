[
  {
    name: "Sir Knight",
    level: 1,
    max_hp: 10,
    current_hp: 10,
    attack: 3,
    defense: 2,
  },
  {
    name: "Peasant",
    level: 1,
    max_hp: 6,
    current_hp: 6,
    attack: 1,
    defense: 0,
  },
  {
    name: "Barbarian",
    level: 1,
    max_hp: 12,
    current_hp: 12,
    attack: 4,
    defense: 1,
  }
].each do |params|
  Character.find_or_initialize_by(name: params[:name]).update!(**params)
end
