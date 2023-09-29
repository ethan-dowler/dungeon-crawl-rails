class EquipInventoryItem
  attr_reader :character, :inventory_item

  def initialize(character:, inventory_item:)
    @character = character
    @inventory_item = inventory_item
  end
  
  def execute
    Character.transaction do
      mark_as_equipped
      add_modifiers
    end
  end

  private

  def add_modifiers
    inventory_item.modifiers.each do |modifier|
      modifier.dup.update!(
        source: inventory_item,
        target: character
      )
    end
  end

  def mark_as_equipped
    inventory_item.update!(equipped: true)
  end
end
