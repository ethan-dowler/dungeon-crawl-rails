class Item < ApplicationRecord
  include Modifiable

  scope :armor, -> { where(equipment_slot: EquipmentSlot::ARMOR) }
  scope :hands, -> { where(equipment_slot: EquipmentSlot::HAND) }

  def equippable? = equipment_slot.present?
  def handheld? = equipment_slot == EquipmentSlot::HAND

  module EquipmentSlot
    ARMOR = 'ARMOR'.freeze
    HAND = 'HAND'.freeze

    # TODO
    # HEAD = "HEAD".freeze
    # NECK = "NECK".freeze
    # BACK = "BACK".freeze
    # WAIST = "WAIST".freeze
    # FEET = "FEET".freeze
  end
end
