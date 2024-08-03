RSpec.describe Modifiable do
  include_context "with seed data"

  describe "#flat_modifier_for" do
    before do
      2.times { player_character.modifiers.flat.max_hp.create!(value: 10) }
    end

    it "returns the sum of flat mods for a given stat" do
      expect(player_character.flat_modifier_for(:max_hp)).to eq(20)
    end
  end

  describe "#percent_modifier_for" do
    before do
      2.times { player_character.modifiers.percent.max_hp.create!(value: 10) }
    end

    it "returns a multiplier based on the total percentage points" do
      expect(player_character.percent_modifier_for(:max_hp)).to eq(1.2)
    end
  end
end
