class CharacterStatsComponent < ApplicationComponent
  attr_reader :character

  # use map of stat to visual indicator instead of #titleize
  # e.g. speed_rating -> SR; armor_rating = AR; damage_rating = DR
  TOP_ROW_STATS = %i[
    max_hp
    speed_rating
  ].freeze

  BOT_ROW_STATS = %i[
    damage_rating
    armor_rating
  ].freeze

  def initialize(character)
    @character = character
  end
end
