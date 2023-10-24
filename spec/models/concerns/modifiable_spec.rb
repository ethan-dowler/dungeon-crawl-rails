RSpec.describe Modifiable do
  describe '#total' do
    subject(:garchomp) do
      Character.create!(
        name: 'Garchomp',
        level: 78,
        base_hp: 108,
        base_attack: 130,
        base_defense: 95,
        base_speed: 102
      )
    end

    # See Example: https://bulbapedia.bulbagarden.net/wiki/Stat#Generation_III_onward
    context 'when modifiers are applied' do
      before do
        # IVs + EVs
        garchomp.modifiers.create!(
          source: garchomp,
          modifier_type: :flat,
          stat: :hp,
          value: 42
        )
        garchomp.modifiers.create!(
          source: garchomp,
          modifier_type: :flat,
          stat: :attack,
          value: 59
        )
        garchomp.modifiers.create!(
          source: garchomp,
          modifier_type: :flat,
          stat: :defense,
          value: 52
        )
        garchomp.modifiers.create!(
          source: garchomp,
          modifier_type: :flat,
          stat: :speed,
          value: 10
        )
        # Nature
        garchomp.modifiers.create!(
          source: garchomp,
          modifier_type: :percent,
          stat: :attack,
          value: 10
        )
      end

      it 'calculates the correct total for a given stat' do
        expect(garchomp.total(:hp)).to eq(289)
        expect(garchomp.total(:attack)).to eq(278)
        expect(garchomp.total(:defense)).to eq(193)
        expect(garchomp.total(:speed)).to eq(171)
      end
    end
  end
end
