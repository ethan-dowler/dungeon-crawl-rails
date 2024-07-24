RSpec.describe BasicAttack do
  subject(:basic_attack) { described_class.new(attacker: character, defender: monster) }

  include_context "with seed data"

  describe "#execute" do
    before do
      character_equip_sword
    end

    it "applies the correct amount of damage" do
      basic_attack.execute

      expect(monster.reload.current_hp).to eq(2)
    end
  end
end
