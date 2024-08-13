raise "Cannot run seeds more than once. Use db:seed:replant to start over." if SaveFile.exists?

save_file = SaveFile.create!(name: "Omega Squad")

require_relative "seeds/character_seed"
require_relative "seeds/equipment_seed"
require_relative "seeds/monster_seed"
require_relative "seeds/map_one_seed"

# add a few of each item to starting stock
# TODO: allow player to "buy" starting equipment
ItemTemplate.equipment.find_each do |item_template|
  AddInventoryItem.new(owner: save_file, item_template:).execute
end

# create game world
MapTemplate.first.generate_instance(save_file: save_file)

# start game in south room of ground floor
save_file.update!(
  location: Map.first.find_tile(x: 0, y: -1, z: 0)
)
