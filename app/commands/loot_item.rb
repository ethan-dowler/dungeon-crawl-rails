class LootItem
  attr_reader :character, :inventory_item, :previous_owner_name

  def initialize(character:, inventory_item:)
    @character = character
    @inventory_item = inventory_item
    @previous_owner_name = inventory_item.owner.name
  end

  def execute
    InventoryItem.transaction do
      TransferItem.new(inventory_item:, receiver: character).execute
      character.current_run.log("You loot a #{inventory_item.name} from #{previous_owner_name}.")
    end
  end
end
