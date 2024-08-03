class NonPlayerCharacter < ApplicationRecord
  include Conditionable
  include HasHp
  include Modifiable

  belongs_to :save_file
  belongs_to :npc_template
  belongs_to :location, class_name: "Tile", optional: true

  has_many :drops, through: :npc_template

  delegate_missing_to :npc_template

  # for each possible drop, roll to see if that drop appears
  # return an array of potential loot (not yet saved)
  def roll_for_drops
    drops.map do |drop|
      next unless Random.new.rand(100) < drop.percent_chance

      Items.new(
        item_template: drop.item_template,
        quantity: drop.quantity
      )
    end.compact
  end
end
