class HeadingComponent < ViewComponent::Base
  attr_reader :title, :tag

  def initialize(title:, tag: :h1)
    @title = title
    @tag = tag
  end

  def tag_classes
    case tag
    when :h1
      "text-3xl mb-4"
    when :h2
      "text-xl mb-2"
    end
  end
end
