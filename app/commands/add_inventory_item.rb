class AddInventoryItem
  attr_reader :owner, :item

  def initialize(owner:, item:)
    @owner = owner
    @item = item
  end

  def execute
    owner.inventory_items.create!(item:)
  end
end
