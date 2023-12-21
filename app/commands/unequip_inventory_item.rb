class UnequipInventoryItem
  attr_reader :inventory_item

  def initialize(inventory_item:)
    @inventory_item = inventory_item
    @owner = inventory_item.owner
  end

  def execute
    InventoryItem.transaction do
      inventory_item.update!(equipped: false)
      # There used to be more in here related to modifiers,
      # but that was moved to an after_update hook in InventoryItem.rb
      # Keeping this to compliment EquipInventoryItem
      # and in case we need more logic in the future
    end
  end
end
