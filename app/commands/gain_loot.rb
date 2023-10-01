class GainLoot
  attr_reader :character, :monster

  def initialize(character:, monster:)
    @character = character
    @monster = monster
  end

  def execute
    # TODO: calculate odds of dropping an item at all!
    #       currently dropping an item 100% of the time
    reward_pool =
      monster.item_drops.reduce([]) do |pool, drop|
        drop.odds.times { pool << drop.item_id }
        pool
      end

    # TODO: use quantity instead of adding multiple of same item
    character.inventory_items.create!(
      item_id: reward_pool.sample
    )
  end

private

  def xp_to_gain
    ((monster.base_experience_yield * monster.level.to_f) / 7.0).round
  end
end
