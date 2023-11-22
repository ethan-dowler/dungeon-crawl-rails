class ProgressBarComponent < ViewComponent::Base
  attr_reader :label, :current_value, :max_value, :color, :width

  FILL_COLOR_CLASSES = {
    red: "bg-red-600",
    blue: "bg-blue-600",
    black: "bg-black"
  }.freeze

  BAR_HEIGHT_CLASSES = {
    thick: "h-2",
    thin: "h-1"
  }.freeze

  def initialize(label:, current_value:, max_value:, color: :blue, width: :thick)
    @label = label
    @current_value = current_value
    @max_value = max_value
    @color = color
    @width = width
  end

  def bar_height_class = BAR_HEIGHT_CLASSES[width]

  def fill_color_class = FILL_COLOR_CLASSES[color]

  def fill_percent
    return 0 if max_value.blank?

    (current_value.to_f * 100) / max_value
  end
end
