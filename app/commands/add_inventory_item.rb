class AddInventoryItem
  attr_reader :owner, :item_template

  def initialize(owner:, item_template:)
    @owner = owner
    @item_template = item_template
  end

  def execute
    owner.items.create!(item_template:)
  end
end
