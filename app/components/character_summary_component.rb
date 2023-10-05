class CharacterSummaryComponent < ViewComponent::Base
  attr_reader :character

  delegate :name, :level, :current_hp, :max_hp, to: :character

  def initialize(character)
    @character = character
  end
end
