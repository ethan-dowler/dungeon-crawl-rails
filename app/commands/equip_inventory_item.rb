class EquipInventoryItem
  attr_reader :owner, :inventory_item

  def initialize(owner:, inventory_item:)
    @owner = owner
    @inventory_item = inventory_item
  end

  def execute
    InventoryItem.transaction do
      equipped_item = owner.inventory_items.equipped.where(equipment_slot: inventory_item.equipment_slot)
      UnequipInventoryItem.new(inventory_item: equipped_item).execute if equipped_item.present?

      inventory_item.update!(equipped: true)
      add_modifiers
    end
  end

  private

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
