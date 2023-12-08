class GainLoot
  attr_reader :character, :monster

  def initialize(character:, monster:)
    @character = character
    @monster = monster
  end

  # For each possible drop, roll to see if that drop appears.
  def execute
    monster.item_drops.each do |item_drop|
      next unless Random.new.rand(100) < item_drop.percent_chance

      character.inventory_items.create!(item: item_drop.item)
    end
  end
end
