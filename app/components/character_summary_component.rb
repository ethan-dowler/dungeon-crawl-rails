class CharacterSummaryComponent < ViewComponent::Base
  attr_reader :character

  def initialize(character)
    @character = character
  end

  def name = character.name
  def level = character.level
  def current_hp = character.current_hp
  def max_hp = character.max_hp
end
