class Item < ApplicationRecord
  include Modifiable

  has_many :personality_traits, as: :owner, dependent: :destroy
  has_many :traits, through: :personality_traits

  scope :armor, -> { where(equipment_slot: EquipmentSlot::ARMOR) }
  scope :primary, -> { where(equipment_slot: EquipmentSlot::PRIMARY) }
  scope :secondary, -> { where(equipment_slot: EquipmentSlot::SECONDARY) }

  def equippable? = equipment_slot.present?

  def armor? = equipment_slot == EquipmentSlot::ARMOR
  def primary? = equipment_slot == EquipmentSlot::PRIMARY
  def secondary? = equipment_slot == EquipmentSlot::SECONDARY

  def two_handed? = traits.include?(Trait::TWO_HANDED)
  def dual_wield? = traits.include?(Trait::DUAL_WIELD)

  module EquipmentSlot
    ARMOR = "ARMOR".freeze
    PRIMARY = "PRIMARY".freeze
    SECONDARY = "SECONDARY".freeze
  end

  module Trait
    # if primary is two-handed, can't equip a secondary
    # ex. bows, great axes, some staves
    TWO_HANDED = "two-handed".freeze
    # if primary is dual wield, it can be equipped as a secondary
    FLEXIBLE = "flexible".freeze
  end
end
