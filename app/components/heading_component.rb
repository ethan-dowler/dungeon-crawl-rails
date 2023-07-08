class HeadingComponent < ViewComponent::Base
  attr_reader :title, :tag

  def initialize(title:, tag: :h1)
    @title = title
    @tag = tag
  end
end
