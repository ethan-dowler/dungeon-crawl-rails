class PlayerCharacterSummaryComponent < ApplicationComponent
  attr_reader :player_character, :previous_player_character

  delegate :name, :level, :current_hp, :max_hp, :xp, :xp_to_next_level, to: :player_character

  def initialize(player_character, previous_player_character: nil)
    @player_character = player_character
    @previous_player_character = previous_player_character
  end

  def xp_progress_to_next_level = player_character.xp - player_character.xp_for_current_level

  def xp_needed_from_current_to_next_level = player_character.xp_to_next_level - player_character.xp_for_current_level

  def previous_hp
    return nil if previous_player_character.nil?

    previous_player_character.current_hp
  end

  def previous_xp_progress_to_next_level
    return nil if previous_player_character.nil?

    previous_player_character.xp - previous_player_character.xp_for_current_level
  end
end
