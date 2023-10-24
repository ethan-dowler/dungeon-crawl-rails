class CharacterSummaryComponent < ViewComponent::Base
  attr_reader :character

  delegate :name, :level, :current_hp, :max_hp, :xp, :xp_to_next_level, to: :character

  def initialize(character)
    @character = character
  end

  def xp_progress_to_next_level = character.xp - character.xp_for_current_level

  def xp_between_current_and_next_level = character.xp_to_next_level - character.xp_for_current_level
end
