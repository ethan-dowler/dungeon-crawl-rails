class Condition < ApplicationRecord
  module Type
    # lasts until the end of the current battle
    BATTLE = "BATTLE".freeze
    # lasts until the character rests
    RESIDUAL = "RESIDUAL".freeze
  end
end
