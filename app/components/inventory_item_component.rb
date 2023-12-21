class InventoryItemComponent < ViewComponent::Base
  attr_reader :inventory_item

  def initialize(inventory_item)
    @inventory_item = inventory_item
  end
end
