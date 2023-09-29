module Conditionable
  extend ActiveSupport::Concern

  included do
    has_many :conditions, as: :target
  end
end
