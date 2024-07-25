RSpec.describe Modifiable do
  include_context "with seed data"

  describe "#flat_modifier_for" do
    before do
      2.times { character.modifiers.flat.max_hp.create!(value: 10) }
    end

    it "returns the sum of flat mods for a given stat" do
      expect(character.flat_modifier_for(:max_hp)).to eq(20)
    end
  end

  describe "#percent_modifier_for" do
    before do
      2.times { character.modifiers.percent.max_hp.create!(value: 10) }
    end

    it "returns a multiplier based on the total percentage points" do
      expect(character.percent_modifier_for(:max_hp)).to eq(1.2)
    end
  end

  describe "after_save hook" do
    describe "when a core attribute is changed" do
      it "recalculates calculated fields" do
        character.update!(body: 2)

        expect(character.max_hp).to eq(16)
      end
    end

    describe "when the target has no core attributes" do
      it "ignores the callback" do
        expect { sword.update!(name: "Longsword") }.to_not raise_error
      end
    end
  end
end
