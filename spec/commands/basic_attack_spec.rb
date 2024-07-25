RSpec.describe BasicAttack do
  subject(:basic_attack) { described_class.new(attacker: character, defender: monster) }

  include_context "with seed data"

  describe "#execute" do
    before { character_equip_sword }

    it "applies the correct amount of damage" do
      basic_attack.execute

      # character damage rating = 10
      # monster armor rating = 20%
      # the attack deals 8 damage
      expect(monster.reload.current_hp).to eq(2)
    end
  end
end
