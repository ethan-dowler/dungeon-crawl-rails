class Item < ApplicationRecord
  include Modifiable

  scope :armor, -> { where(equipment_slot: EquipmentSlot::ARMOR) }
  scope :primary, -> { where(equipment_slot: EquipmentSlot::PRIMARY) }
  scope :secondary, -> { where(equipment_slot: EquipmentSlot::SECONDARY) }

  def equippable? = equipment_slot.present?

  def armor? = equipment_slot == EquipmentSlot::ARMOR
  def primary? = equipment_slot == EquipmentSlot::PRIMARY
  def secondary? = equipment_slot == EquipmentSlot::SECONDARY

  def restricted? = traits.include?(Trait::RESTRICTED)
  def dual_wield? = traits.include?(Trait::DUAL_WIELD)

  module EquipmentSlot
    ARMOR = "ARMOR".freeze
    PRIMARY = "PRIMARY".freeze
    SECONDARY = "SECONDARY".freeze
  end

  module Trait
    # if primary is restricted, can't equip a secondary
    # ex. bows, great axes, some staves
    RESTRICTED = "RESTRICTED".freeze
    # if primary is dual wield, it can be equipped as a secondary
    DUAL_WIELD = "DUAL_WIELD".freeze
  end
end
