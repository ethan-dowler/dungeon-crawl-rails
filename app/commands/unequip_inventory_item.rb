class UnequipInventoryItem
  attr_reader :character, :inventory_item

  def initialize(character:, inventory_item:)
    @character = character
    @inventory_item = inventory_item
  end
  
  def execute
    Character.transaction do
      inventory_item.unequip
      remove_modifiers
    end
  end

private

  def remove_modifiers
    character.modifiers.where(source: inventory_item).destroy_all
  end
end
