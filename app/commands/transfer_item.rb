class TransferItem
  attr_reader :inventory_item, :receiver

  def initialize(inventory_item:, receiver:)
    @inventory_item = inventory_item
    @receiver = receiver
  end

  def execute
    InventoryItem.transaction do
      AddInventoryItem.new(owner: receiver, inventory_item:).execute
      RemoveInventoryItem.new(inventory_item:).execute
    end
  end
end
