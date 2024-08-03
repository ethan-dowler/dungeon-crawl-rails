RSpec.describe PlayerCharacter do
  include_context "with seed data"

  describe "after_save hook" do
    describe "when a core attribute is changed" do
      it "recalculates calculated fields" do
        player_character.update!(body: 2)

        expect(player_character.max_hp).to eq(16)
      end
    end
  end
end
