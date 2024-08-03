RSpec.shared_context "with seed data" do
  let(:save_file) { SaveFile.create!(name: "Save File 1") }

  let(:player_character) { save_file.player_characters.create!(name: "Player Character 1") }

  let(:monster_template) { NpcTemplate.create!(name: "Monster 1", armor_rating: 20) }
  let(:monster) do
    NonPlayerCharacter.create!(
      save_file:,
      npc_template: monster_template,
      current_hp: 10
    )
  end

  let(:sword_template) do
    item = ItemTemplate.create!(name: "Sword")
    item.modifiers.flat.damage_rating.create!(value: 10)
    item
  end

  def character_equip_sword
    item = AddInventoryItem.new(owner: player_character, item_template: sword_template).execute
    item.equip
  end
end
