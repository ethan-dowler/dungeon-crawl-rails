class EquipItem
  attr_reader :new_inventory_item, :owner

  def initialize(new_inventory_item)
    @new_inventory_item = new_inventory_item
    @owner = new_inventory_item.owner
  end

  def execute
    return if new_inventory_item.equipped?

    Item.transaction do
      unequip_current_items
      unequip_secondary if new_inventory_item.two_handed?
      # TODO: need to check for ANY type. can't add a dual wield if already holding a 2H weapon either
      unequip_two_handed_primary if new_inventory_item.secondary?
      new_inventory_item.update!(equipped: true)
    end
  end

  private

  def unequip_current_items
    # may have multiple primaries equipped if dual-wielding
    current_items_in_slot = owner.items.with_same_slot(new_inventory_item).equipped
    return if current_items_in_slot.none?

    if current_items_in_slot.first.dual_wield? && new_inventory_item.dual_wield?
      # when equipping a second dual-wield weapon, remove the secondary item to "make room"
      unequip_secondary
    else
      current_items_in_slot.each { UnequipItem.new(_1).execute }
    end
  end

  def unequip_secondary
    # should never have more than one secondary equipped
    secondary_item =
      owner.items.secondary.equipped.first
    UnequipItem.new(secondary_item).execute if secondary_item.present?
  end

  def unequip_two_handed_primary
    two_handed_primary = owner.items.two_handed.equipped.first
    UnequipItem.new(two_handed_primary).execute if two_handed_primary.present?
  end
end
