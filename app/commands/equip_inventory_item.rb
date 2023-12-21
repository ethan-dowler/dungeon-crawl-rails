class EquipInventoryItem
  attr_reader :inventory_item

  def initialize(inventory_item:)
    @inventory_item = inventory_item
  end

  def execute
    return if inventory_item.equipped?

    InventoryItem.transaction do
      unequip_current_item
      inventory_item.update!(equipped: true)
    end
  end

  private

  def unequip_current_item
    equipped_items =
      InventoryItem.where(owner: inventory_item.owner).with_same_slot(inventory_item).equipped
    max_quantity = inventory_item.handheld? ? 2 : 1
    return unless equipped_items.size >= max_quantity

    item_to_remove = equipped_items.min_by(&:value)
    UnequipInventoryItem.new(inventory_item: item_to_remove).execute
  end
end
