module Modifiable
  # flat bonus to base value
  def hp_flat_modifier = flat_modifier_for(:hp)
    def attack_flat_modifier = flat_modifier_for(:attack)
    def defense_flat_modifier = flat_modifier_for(:defense)
  
    # multiplier for base + bonus
    def hp_percent_modifier = percent_modifier_for(:hp)
    def attack_percent_modifier = percent_modifier_for(:attack)
    def defense_percent_modifier = percent_modifier_for(:defense)
  
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
end
