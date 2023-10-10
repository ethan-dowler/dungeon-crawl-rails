class CharacterSummaryComponent < ViewComponent::Base
  attr_reader :character

  delegate :name, :level, :current_hp, :max_hp, :xp, :xp_to_next_level, to: :character

  def initialize(character)
    @character = character
  end
end
