RSpec.describe Modifiable do
  describe '#total' do
    subject(:character) do
      Character.create!(
        name: 'Hero',
        base_hp:,
        base_attack:,
        base_defense:
      )
    end

    let(:base_hp) { 10 }
    let(:base_attack) { 10 }
    let(:base_defense) { 10 }

    context 'when the subject has a flat modifier' do
      before do
        character.modifiers.create!(
          source: character,
          stat: :hp,
          modifier_type: :flat,
          value: 10
        )
      end

      it 'provides the correct total for the modified stat' do
        expect(character.max_hp).to eq(20)
      end
    end

    context 'when the subject has a percent modifier' do
      before do
        character.modifiers.create!(
          source: character,
          stat: :hp,
          modifier_type: :percent,
          value: 10
        )
      end

      it 'provides the correct total for the modified stat' do
        expect(character.max_hp).to eq(11)
      end
    end

    context 'when the subject has both a flat and a percent modifier' do
      before do
        character.modifiers.create!(
          source: character,
          stat: :hp,
          modifier_type: :flat,
          value: 10
        )
        character.modifiers.create!(
          source: character,
          stat: :hp,
          modifier_type: :percent,
          value: 10
        )
      end

      it 'applies the flat modifier before the percent modifier' do
        expect(character.max_hp).to eq(22)
      end
    end
  end

  describe '#poke_total' do
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
        expect(garchomp.poke_total(:hp)).to eq(289)
        expect(garchomp.poke_total(:attack)).to eq(278)
        expect(garchomp.poke_total(:defense)).to eq(193)
        expect(garchomp.poke_total(:speed)).to eq(171)
      end
    end
  end
end
