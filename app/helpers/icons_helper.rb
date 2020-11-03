module IconsHelper
  def icon(name)
    tag.span class: :icon do
      tag.i nil, class: name
    end
  end
end
