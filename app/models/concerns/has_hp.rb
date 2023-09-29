# must implement base_hp and current_hp
# may implement max_hp
module HasHp
  extend ActiveSupport::Concern

  included do
    before_validation :set_current_hp, only: :create
    before_validation :enforce_hp_boundaries, only: :update
  end

  def max_hp = base_hp

private

  def set_current_hp
    self.current_hp = base_hp if current_hp.nil?
  end

  def enforce_hp_boundaries
    self.current_hp = 0 if current_hp.negative?
    self.current_hp = max_hp if current_hp > max_hp
  end
end
