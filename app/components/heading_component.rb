class HeadingComponent < ApplicationComponent
  attr_reader :title, :tag

  def initialize(title:, tag: :h1)
    @title = title
    @tag = tag
  end

  def tag_classes = "Heading Heading--#{tag}"
end
