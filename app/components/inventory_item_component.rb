class InventoryItemComponent < ApplicationComponent
  attr_reader :inventory_item

  def initialize(inventory_item)
    @inventory_item = inventory_item
  end

  def equip_text = inventory_item.equipped? ? "Unequip" : "Equip"
end
