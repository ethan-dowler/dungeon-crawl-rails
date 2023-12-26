class PersonalityTrait < ApplicationRecord
  belongs_to :owner, polymorphic: true
  belongs_to :trait

  delegate_missing_to :trait
end
