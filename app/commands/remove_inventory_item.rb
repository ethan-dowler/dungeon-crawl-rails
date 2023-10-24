class RemoveInventoryItem
  attr_reader :inventory_item

  def initialize(inventory_item:)
    @inventory_item = inventory_item
  end

  def execute
    InventoryItem.transaction do
      UnequipInventoryItem.new(inventory_item:).execute if inventory_item.equipped?
      inventory_item.destroy!
    end
  end
end
