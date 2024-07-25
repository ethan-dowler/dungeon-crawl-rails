RSpec.describe Modifier do
  include_context "with seed data"

  describe "#set_default_source - before_create"

  describe "after_save/after_destroy hook" do
    before do
      character.modifiers.max_hp.flat.create!(value: 10, source: character)
      character.modifiers.speed_factor.flat.create!(value: 10, source: character)
      character.modifiers.armor_rating.flat.create!(value: 10, source: character)
      character.modifiers.damage_rating.flat.create!(value: 10, source: character)

      character.update!(max_hp: 0, speed_factor: 0, armor_rating: 0, damage_rating: 0)
    end

    describe "when a modifier is changed" do
      it "recalculates all calculated fields" do
        character.modifiers.max_hp.flat.first.update!(value: 30)

        expect(character.max_hp).to eq(40)
        expect(character.speed_factor).to eq(20)
        expect(character.armor_rating).to eq(10)
        expect(character.damage_rating).to eq(10)
      end
    end

    describe "when a new modifier is added" do
      it "recalculates all calculated fields" do
        character.modifiers.max_hp.flat.create!(value: 10, source: character)

        expect(character.max_hp).to eq(30)
        expect(character.speed_factor).to eq(20)
        expect(character.armor_rating).to eq(10)
        expect(character.damage_rating).to eq(10)
      end
    end

    describe "when a modifier is removed" do
      it "recalculates all calculated fields" do
        character.modifiers.max_hp.flat.first.destroy

        expect(character.max_hp).to eq(10)
        expect(character.speed_factor).to eq(20)
        expect(character.armor_rating).to eq(10)
        expect(character.damage_rating).to eq(10)
      end
    end
  end
end
