class Trait < ApplicationRecord
  module Weapon
    # if primary is two-handed, can't equip a secondary
    # ex. bows, great axes, some staves
    TWO_HANDED = "two-handed".freeze
    # can equip two dual-wield primaries
    DUAL_WIELD = "dual-wield".freeze
  end

  module Armor
    # TODO
  end

  module Character
    # TODO
  end
end
