class Monster < ApplicationRecord
  include Conditionable
  include Modifiable
  include HasHp

  belongs_to :monster_template
  has_many :drops, through: :monster_template

  has_many :inventory_items, as: :owner, dependent: :destroy

  belongs_to :current_room, class_name: 'Room'
  has_one :dungeon, through: :current_room

  delegate :name, :base_hp, :base_attack, :base_defense, :base_experience_yield, to: :monster_template

  after_create :add_inventory

  def max_hp = total(:hp)
  def attack = total(:attack)
  def defense = total(:defense)

  private

  # for each possible drop, roll to see if that drop appears
  # then equip that item if possible
  def add_inventory
    drops.each do |drop|
      next unless Random.new.rand(100) < drop.percent_chance

      inventory_item = inventory_items.create!(item: drop.item, quantity: drop.quantity)
      EquipInventoryItem.new(inventory_item).execute if inventory_item.equippable?
    end
  end
end
