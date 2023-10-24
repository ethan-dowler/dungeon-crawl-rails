class Item < ApplicationRecord
  def equippable? = equipment_slot.present?

  module EquipmentSlot
    ARMOR = 'ARMOR'.freeze
    PRIMARY_HAND = 'PRIMARY_HAND'.freeze
    OFF_HAND = 'OFF_HAND'.freeze

    # TODO
    # HEAD = "HEAD".freeze
    # NECK = "NECK".freeze
    # BACK = "BACK".freeze
    # WAIST = "WAIST".freeze
    # FEET = "FEET".freeze
  end
end
