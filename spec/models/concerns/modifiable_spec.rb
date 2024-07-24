RSpec.describe Modifiable do
  # TODO: fix these tests!
  xdescribe "#total" do
    subject(:fakemon) do
      Character.create!(
        name: "Fakémon",
        level: 50,
        base_hp: 100,
        base_attack: 150,
        base_defense: 100,
        base_speed: 100
      )
    end

    # Inspired by Pokemon stats: https://bulbapedia.bulbagarden.net/wiki/Stat#Generation_III_onward
    # only difference is that flat mods (analogous to IVs + EVs) are added to the TOTAL instead of the BASE
    context "when modifiers are applied" do
      before do
        # Flat mods; added at the END of the equation
        fakemon.modifiers.flat.hp.create!(source: fakemon, value: 50)
        fakemon.modifiers.flat.attack.create!(source: fakemon, value: 50)
        fakemon.modifiers.flat.defense.create!(source: fakemon, value: 50)
        # Percent mods; only applies to base
        fakemon.modifiers.percent.attack.create!(source: fakemon, value: 50)
      end

      it "calculates the correct total for a given stat" do
        expect(fakemon.total(:hp)).to eq(210)
        expect(fakemon.total(:attack)).to eq(282)
        expect(fakemon.total(:defense)).to eq(155)
        expect(fakemon.total(:speed)).to eq(105)
      end
    end
  end
end
