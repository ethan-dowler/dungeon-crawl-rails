class PcStatsComponent < ApplicationComponent
  attr_reader :player_character

  # use map of stat to visual indicator instead of #titleize
  # e.g. speed_rating -> SR; armor_rating = AR; damage_rating = DR
  STATS = [
    { stat: :damage_rating, label: "ATTACK" },
    { stat: :armor_rating, label: "ARMOR" },
    { stat: :speed_rating, label: "SPEED" }
  ].freeze

  def initialize(player_character)
    @player_character = player_character
  end
end
