class EquipInventoryItem
  attr_reader :owner, :inventory_item

  def initialize(owner:, inventory_item:)
    @owner = owner
    @inventory_item = inventory_item
  end

  def execute
    InventoryItem.transaction do
      unequip_current_item
      inventory_item.update!(equipped: true)
      add_modifiers
    end
  end

  private

  def unequip_current_item
    equipped_items = owner.inventory_items.equipped.where(equipment_slot: inventory_item.equipment_slot)
    return unless equipped_items.size == 1 || (equipped_items.size == 2 && inventory_item.handheld?)

    item_to_remove = equipped_items.min_by(&:value)
    UnequipInventoryItem.new(inventory_item: item_to_remove).execute
  end

  def add_modifiers
    return unless owner.respond_to?(:modifiers)

    inventory_item.modifiers.each do |modifier|
      modifier.dup.update!(
        source: inventory_item,
        target: owner
      )
    end
  end
end
