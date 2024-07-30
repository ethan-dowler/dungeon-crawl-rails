class Map < ApplicationRecord
  belongs_to :map_template
  has_many :tiles, dependent: :destroy

  delegate :name, :description, to: :map_template
end

# TODO: continue migrating everything from a dungeon-centric approach to a map-centric approach
# in preparation for moving to a full RPG instead of just a dungeon crawler.
