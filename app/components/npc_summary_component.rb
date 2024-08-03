class NpcSummaryComponent < ApplicationComponent
  attr_reader :non_player_character

  def initialize(non_player_character)
    @non_player_character = non_player_character
  end
end
