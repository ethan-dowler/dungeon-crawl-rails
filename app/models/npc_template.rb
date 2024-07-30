class NpcTemplate < ApplicationRecord
  has_many :drops, dependent: :destroy
end
