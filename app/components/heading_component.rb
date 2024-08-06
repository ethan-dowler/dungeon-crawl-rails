class HeadingComponent < ApplicationComponent
  attr_reader :title, :tag, :classes

  def initialize(title:, tag: :h1, classes: nil)
    @title = title
    @tag = tag
    @classes = classes
  end

  def tag_classes
    class_string = "Heading Heading--#{tag}"
    class_string += " #{classes}" if classes.present?
    class_string
  end
end
