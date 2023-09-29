class UnequipInventoryItem
  attr_reader :character, :inventory_item

  def initialize(character:, inventory_item:)
    @character = character
    @inventory_item = inventory_item
  end
  
  def execute
    Character.transaction do
      remove_modifiers
      mark_as_unequipped
    end
  end

private

  def remove_modifiers
    character.modifiers.where(source: inventory_item).destroy_all
  end

  def mark_as_unequipped
    inventory_item.update!(equipped: false)
  end
end
