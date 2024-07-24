RSpec.shared_context "with seed data" do
  let(:character) { Character.create!(name: "Character") }

  let(:monster_template) { MonsterTemplate.create!(name: "Monster", armor_rating: 20) }
  let(:monster) { Monster.create!(monster_template:, current_hp: 10) }

  let(:sword) do
    item = Item.create!(name: "Sword")
    item.modifiers.flat.damage_rating.create!(value: 10)
    item
  end

  def character_equip_sword
    inventory_item = AddInventoryItem.new(owner: character, item: sword).execute
    inventory_item.equip
  end
end
