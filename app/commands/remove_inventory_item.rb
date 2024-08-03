class RemoveInventoryItem
  attr_reader :inventory_item, :quantity

  def initialize(inventory_item:, quantity: 1)
    @inventory_item = inventory_item
    @quantity = quantity
  end

  def execute
    InventoryItem.transaction do
      UnequipItem.new(inventory_item).execute if inventory_item.equipped?

      reduce_quantity
    end
  end

  def reduce_quantity
    if inventory_item.stackable? && inventory_item.quantity > 1
      inventory_item.update!(quantity: inventory_item.quantity - 1)
    else
      inventory_item.destroy!
    end
  end
end
