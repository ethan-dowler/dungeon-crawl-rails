class AddInventoryItem
  attr_reader :owner, :inventory_item, :item

  def initialize(owner:, inventory_item: nil, item: nil)
    raise ArgumentError, "Must provide either inventory_item or item" if inventory_item.nil? && item.nil?

    @owner = owner
    @inventory_item = inventory_item
    @item = item
  end

  def execute
    if inventory_item.present?
      inventory_item.dup.update!(owner:)
    else
      owner.inventory_items.create!(item:)
    end
  end
end
