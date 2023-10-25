class CharacterSummaryComponent < ViewComponent::Base
  attr_reader :character, :show_status
  alias show_status? show_status

  delegate :name, :level, :current_hp, :max_hp, :xp, :xp_to_next_level, to: :character

  def initialize(character, show_status: true)
    @character = character
    @show_status = show_status
  end

  def xp_progress_to_next_level = character.xp - character.xp_for_current_level

  def xp_between_current_and_next_level = character.xp_to_next_level - character.xp_for_current_level
end
