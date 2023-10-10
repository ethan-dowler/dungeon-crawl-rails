class Character < ApplicationRecord
  include Conditionable
  include Modifiable
  include HasHp

  # stat calculation
  # HP = floor(0.01 x (2 x Base + IV + floor(0.25 x EV)) x Level) + Level + 10
  # Other Stats = (floor(0.01 x (2 x Base + IV + floor(0.25 x EV)) x Level) + 5) x Nature

  has_many :dungeon_runs, dependent: :destroy

  has_many :inventory_items, dependent: :destroy
  has_many :items, through: :inventory_items, dependent: :destroy

  before_create :set_xp
  after_update :check_level_up, if: :xp_previously_changed?

  validates :level, comparison: { greater_than: 0 }

  def max_hp = total(:hp)
  def attack = total(:attack)
  def defense = total(:defense)

  def xp_to_next_level = level**3
  # TODO: calculate XP between current level and next instead of total XP

  def poke_attack
    poke_total(:attack)
  end

  def refresh
    update!(current_hp: max_hp)
    # TODO: remove any negative debuffs
  end

  private

  def set_xp
    self.xp = (level - 1) ** 3
  end

  def check_level_up
    return unless xp > xp_to_next_level

    update!(level: level + 1)
    check_level_up
  end
end
