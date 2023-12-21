class CharacterStatsComponent < ViewComponent::Base
  attr_reader :character

  TOP_ROW_STATS = %i[
    hp
    attack
    defense
  ].freeze

  BOT_ROW_STATS = %i[
    speed
    spirit
    wisdom
  ].freeze

  def initialize(character)
    @character = character
  end
end
