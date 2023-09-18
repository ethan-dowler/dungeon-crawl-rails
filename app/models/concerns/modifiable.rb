module Modifiable
  extend ActiveSupport::Concern

  included do
    has_many :modifiers, as: :source
  end

private

  def flat_modifier_for(stat)
    # modifiers directly on the character
    modifiers.flat.send(stat).sum(&:value)
    # TODO: check for modifiers on equipment
  end
  
  def percent_modifier_for(stat)
    # modifiers directly on the character
    1.0 + (modifiers.percent.send(stat).sum(&:value).to_f / 100.0)
    # TODO: check for modifiers on equipment
  end

  def total(stat)
    ((send(:"base_#{stat}") + flat_modifier_for(stat)) * percent_modifier_for(stat)).round
  end
end
