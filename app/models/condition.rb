class Condition < ApplicationRecord
  module Type
    # lasts until the end of the current (or next) battle
    BATTLE = 'BATTLE'.freeze
    # lasts until the character exits the current floor
    FLOOR = 'FLOOR'.freeze
    # lasts until the character exits the current dungeon
    DUNGEON = 'DUNGEON'.freeze
  end
end
