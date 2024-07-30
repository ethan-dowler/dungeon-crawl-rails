class ItemTemplate < ApplicationRecord
  include Modifiable

  has_many :personality_traits, as: :owner, dependent: :destroy
  has_many :traits, through: :personality_traits

  scope :equipment, -> { where.not(equipment_slot: nil) }
  scope :non_equipment, -> { where(equipment_slot: nil) }

  scope :armor, -> { where(equipment_slot: EquipmentSlot::ARMOR) }
  scope :primary, -> { where(equipment_slot: EquipmentSlot::PRIMARY) }
  scope :secondary, -> { where(equipment_slot: EquipmentSlot::SECONDARY) }

  scope :two_handed, -> { joins(:traits).where(traits: { name: Trait::TWO_HANDED }) }
  scope :dual_wield, -> { joins(:traits).where(traits: { name: Trait::DUAL_WIELD }) }

  def equippable? = equipment_slot.present?

  def armor? = equipment_slot == EquipmentSlot::ARMOR
  def primary? = equipment_slot == EquipmentSlot::PRIMARY
  def secondary? = equipment_slot == EquipmentSlot::SECONDARY

  def two_handed? = traits.exists?(name: Trait::TWO_HANDED)
  def dual_wield? = traits.exists?(name: Trait::DUAL_WIELD)

  module EquipmentSlot
    ARMOR = "ARMOR".freeze
    PRIMARY = "PRIMARY".freeze
    SECONDARY = "SECONDARY".freeze
  end
end
