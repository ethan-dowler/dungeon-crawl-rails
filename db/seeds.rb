raise "Cannot run seeds more than once. Use db:seed:replant to start over." if SaveFile.exists?

require_relative "seeds/character_seed"
require_relative "seeds/equipment_seed"
require_relative "seeds/monster_seed"
require_relative "seeds/dungeon_one_seed"

# start each character with one of each equipment item
# TODO: allow player to "buy" starting equipment
PlayerCharacter.find_each do |pc|
  ItemTemplate.equipment.find_each do |item_template|
    AddInventoryItem.new(owner: pc, item_template:).execute
  end
end
