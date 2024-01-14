raise "Cannot run seeds more than once. Use db:seed:replant to start over." if Character.exists?

require_relative "seeds/character_seed"
require_relative "seeds/equipment_seed"
require_relative "seeds/monster_seed"
require_relative "seeds/dungeon_one_seed"

# start each character with one of each equipment item
# TODO: allow player to "buy" starting equipment
Character.find_each do |character|
  Item.equipment.find_each do |item|
    AddInventoryItem.new(owner: character, item:).execute
  end
end
