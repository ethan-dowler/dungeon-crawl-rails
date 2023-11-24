class CharacterSummaryComponent < ViewComponent::Base
  attr_reader :character, :previous_hp, :show_status
  alias show_status? show_status

  delegate :name, :level, :current_hp, :max_hp, :xp, :xp_to_next_level, to: :character

  # TODO: allow "previous character" param that is the character as it was before the current render. This will make it easy to animate all the things.
  def initialize(character, previous_hp: nil, show_status: true)
    @character = character
    @previous_hp = previous_hp
    @show_status = show_status
  end

  def xp_progress_to_next_level = character.xp - character.xp_for_current_level

  def xp_needed_from_current_to_next_level = character.xp_to_next_level - character.xp_for_current_level
end
