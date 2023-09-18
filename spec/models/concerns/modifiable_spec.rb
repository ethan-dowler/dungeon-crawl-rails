
RSpec.describe Modifiable do
  subject(:character) do
    Character.create!(
      name: "Hero",
      base_hp:,
      base_attack:,
      base_defense:,
    )
  end

  let(:base_hp) { 10 }
  let(:base_attack) { 10 }
  let(:base_defense) { 10 }

  context "when the subject has a flat modifier" do
    before do
      character.modifiers.create!(stat: :hp, modifier_type: :flat, value: 10)
    end

    it "provides the correct total for the modified stat" do
      expect(character.max_hp).to eq(20)
    end
  end

  context "when the subject has a percent modifier" do
    before do
      character.modifiers.create!(stat: :hp, modifier_type: :percent, value: 10)
    end

    it "provides the correct total for the modified stat" do
      expect(character.max_hp).to eq(11)
    end
  end

  context "when the subject has both a flat and a percent modifier" do
    before do
      character.modifiers.create!(stat: :hp, modifier_type: :flat, value: 10)
      character.modifiers.create!(stat: :hp, modifier_type: :percent, value: 10)
    end

    it "applies the flat modifier before the percent modifier" do
      expect(character.max_hp).to eq(22)
    end
  end
end
