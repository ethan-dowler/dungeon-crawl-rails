class Tile < ApplicationRecord
  belongs_to :map
  belongs_to :tile_template
  has_many :encounters, through: :tile_template
  has_many :non_player_characters, foreign_key: :location_id, inverse_of: :location, dependent: :nullify

  delegate_missing_to :tile_template

  scope :with_coords, ->(x:, y:, z:) do
    joins(:tile_template).where(tile_templates: { x:, y:, z: })
  end

  def coords
    "(#{x},#{y},#{z})"
  end

  def roll_for_encounters
    encounters.map do |encounter|
      next unless Random.new.rand(100) < encounter.percent_chance

      NonPlayerCharacter.new(
        npc_template: encounter.npc_template,
        save_file: map.save_file,
        location: self
      )
    end.compact
  end
end
