class MonsterTemplate < ApplicationRecord
  has_many :drops, dependent: :destroy
  has_many :monsters, dependent: :destroy
end
