class ProgressBarComponent < ApplicationComponent
  attr_reader :name, :label, :current_value, :max_value, :previous_value, :color, :variant, :show_value

  alias_method :show_value?, :show_value

  def initialize(name:, label:, current_value:, max_value:, previous_value: nil, color: :blue, variant: :thick, show_value: false) # rubocop:disable Metrics/ParameterLists, Layout/LineLength
    @name = name
    @label = label
    @current_value = current_value
    @max_value = max_value
    @previous_value = previous_value
    @color = color
    @variant = variant
    @show_value = show_value
  end

  def bar_variant_class = "ProgressBar-fillColor--#{variant}"

  def fill_color_class = "ProgressBar-fillColor--#{color}"

  def end_fill_percent
    return 0 if max_value.blank?

    (current_value.to_f * 100) / max_value
  end

  def start_fill_percent
    return end_fill_percent if previous_value.blank?
    return 0 if max_value.blank?

    (previous_value.to_f * 100) / max_value
  end
end
