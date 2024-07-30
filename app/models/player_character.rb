class PlayerCharacter < ApplicationRecord
  include Conditionable
  include Modifiable
  include HasAttributes

  belongs_to :save_file

  has_many :items, as: :owner, dependent: :destroy
  has_many :item_template, through: :items, dependent: :destroy

  before_create :set_xp_for_current_level
  before_update :set_xp_for_current_level, if: :level_changed?
  before_update :check_level_up, if: :xp_changed?

  # XP CALCS
  def xp_to_next_level = (level * 5)**2
  def xp_for_current_level = ((level-1) * 5)**2
  def xp_needed_from_current_to_next_level = xp_to_next_level - xp_for_current_level
  def xp_progress_to_next_level = xp - xp_for_current_level

  def refresh
    update!(current_hp: max_hp)
    # TODO: remove any negative debuffs
  end

  private

  def set_xp_for_current_level
    self.xp = xp_for_current_level
  end

  def check_level_up # rubocop:disable Metrics/AbcSize
    return unless xp > xp_to_next_level

    # need to know what max_hp is before level up
    # to calculate how much it went up
    old_max_hp = max_hp

    # perform the level up
    self.level = level + 1
    current_run.log("You LEVELED UP to Lvl. #{level}! +1 Skill Point") if current_run.present?

    # boost to max_hp also applies to current_hp
    new_max_hp = max_hp
    hp_gained = new_max_hp - old_max_hp
    self.current_hp = current_hp + hp_gained

    # may have enough XP to go up more than one level
    check_level_up
  end
end
