RSpec.describe Modifier do
  include_context "with seed data"

  describe "#set_default_source - before_create"

  describe "after_save/after_destroy hook" do
    before do
      player_character.modifiers.max_hp.flat.create!(value: 10, source: player_character)
      player_character.modifiers.speed_rating.flat.create!(value: 10, source: player_character)
      player_character.modifiers.armor_rating.flat.create!(value: 10, source: player_character)
      player_character.modifiers.damage_rating.flat.create!(value: 10, source: player_character)

      player_character.update!(max_hp: 0, speed_rating: 0, armor_rating: 0, damage_rating: 0)
    end

    describe "when a modifier is changed" do
      it "recalculates all calculated fields" do
        player_character.modifiers.max_hp.flat.first.update!(value: 30)

        expect(player_character.max_hp).to eq(40)
        expect(player_character.speed_rating).to eq(20)
        expect(player_character.armor_rating).to eq(10)
        expect(player_character.damage_rating).to eq(10)
      end
    end

    describe "when a new modifier is added" do
      it "recalculates all calculated fields" do
        player_character.modifiers.max_hp.flat.create!(value: 10, source: player_character)

        expect(player_character.max_hp).to eq(30)
        expect(player_character.speed_rating).to eq(20)
        expect(player_character.armor_rating).to eq(10)
        expect(player_character.damage_rating).to eq(10)
      end
    end

    describe "when a modifier is removed" do
      it "recalculates all calculated fields" do
        player_character.modifiers.max_hp.flat.first.destroy

        expect(player_character.max_hp).to eq(10)
        expect(player_character.speed_rating).to eq(20)
        expect(player_character.armor_rating).to eq(10)
        expect(player_character.damage_rating).to eq(10)
      end
    end
  end
end
