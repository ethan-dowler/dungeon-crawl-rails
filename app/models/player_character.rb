class PlayerCharacter < ApplicationRecord
  include Conditionable
  include HasHp
  include Modifiable

  belongs_to :save_file

  has_many :items, as: :owner, dependent: :destroy
  has_many :item_template, through: :items, dependent: :destroy

  before_save :recalc, if: :core_attribute_changed?
  before_create :set_xp_for_current_level
  before_update :set_xp_for_current_level, if: :level_changed?
  before_update :check_level_up, if: :xp_changed?

  def base_hp = (6 * body) + (4 * spirit)
  def base_speed_rating = (6 * body) + (4 * mind)

  # XP CALCS
  def xp_to_next_level = (level * 5)**2
  def xp_for_current_level = ((level - 1) * 5)**2
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

  def check_level_up
    return unless xp > xp_to_next_level

    self.level = level + 1
    save_file.log("You LEVELED UP to Lvl. #{level}! +1 Skill Point") if current_run.present?
    check_level_up # may have enough XP to go up more than one level
  end

  def core_attribute_changed?
    body_changed? || mind_changed? || spirit_changed?
  end
end
