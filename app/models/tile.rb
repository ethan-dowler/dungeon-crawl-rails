class Tile < ApplicationRecord
  belongs_to :map
  belongs_to :tile_template
  has_many :encounters, through: :tile_template
  has_many :non_player_characters, dependent: :nullify

  delegate_missing_to :tile_template

  def roll_for_encounters
    encounters.each do |encounter|
      next unless Random.new.rand(100) < encounter.percent_chance

      NonPlayerCharacter.create!(npc_template: encounter.npc_template, location: self)
    end
  end
end
