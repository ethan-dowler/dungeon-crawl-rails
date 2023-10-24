class UnequipInventoryItem
  attr_reader :inventory_item

  def initialize(inventory_item:)
    @inventory_item = inventory_item
    @owner = inventory_item.owner
  end

  def execute
    InventoryItem.transaction do
      inventory_item.update!(equipped: false)
      remove_modifiers
    end
  end

  private

  def remove_modifiers
    return unless owner.respond_to?(:modifiers)

    owner.modifiers.where(source: inventory_item).destroy_all
  end
end
