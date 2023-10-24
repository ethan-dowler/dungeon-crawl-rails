class Monster < ApplicationRecord
  include Conditionable
  include Modifiable
  include HasHp

  belongs_to :monster_template
  has_many :item_drops, through: :monster_template

  has_many :inventory_items, as: :owner, dependent: :destroy

  belongs_to :current_room, class_name: 'Room'
  has_one :dungeon, through: :current_room

  delegate :name, :base_hp, :base_attack, :base_defense, :base_experience_yield, to: :monster_template

  after_create :add_inventory

  def max_hp = total(:hp)
  def attack = total(:attack)
  def defense = total(:defense)

  private

  def add_inventory
    item_pool =
      item_drops.each_with_object([]) do |drop, pool|
        drop.odds.times { pool << drop.item_id }
      end

    inventory_item = inventory_items.create!(item_id: item_pool.sample)
    EquipInventoryItem.new(owner: self, inventory_item:) if inventory_item.equippable?
  end
end
