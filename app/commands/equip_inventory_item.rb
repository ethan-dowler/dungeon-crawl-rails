class EquipInventoryItem
  attr_reader :inventory_item

  def initialize(inventory_item)
    @inventory_item = inventory_item
  end

  def execute
    return if inventory_item.equipped?

    InventoryItem.transaction do
      unequip_current_item
      unequip_secondary if inventory_item.two_handed?
      inventory_item.update!(equipped: true)
    end
  end

  private

  def unequip_current_item
    current_item =
      inventory_item.owner.inventory_items.with_same_slot(inventory_item).equipped.first
    return if current_item.nil?

    if inventory_item.dual_wield?
      unequip_secondary
    else
      UnequipInventoryItem.new(current_item).execute
    end
  end

  def unequip_secondary
    secondary_item =
      inventory_item.owner.inventory_items.secondary.equipped.first
    UnequipInventoryItem.new(secondary_item).execute if secondary_item.present?
  end
end
