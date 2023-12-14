class CharacterStatsComponent < ViewComponent::Base
  attr_reader :character

  STATS = %i[
    hp
    attack
    defense
    speed
    spirit
    wisdom
  ].freeze

  def initialize(character)
    @character = character
  end
end
