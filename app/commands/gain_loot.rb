class GainLoot
  attr_reader :character, :monster

  def initialize(character:, monster:)
    @character = character
    @monster = monster
  end

  def execute
    # TODO: customize odds of dropping an item at all!
    #       currently dropping an item 100% of the time

    reward_pool =
      monster.item_drops.each_with_object([]) do |drop, pool|
        drop.odds.times { pool << drop.item_id }
      end

    character.inventory_items.create!(item_id: reward_pool.sample)
  end
end
