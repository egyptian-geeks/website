module IconsHelper
  def icon(name)
    tag.span class: :icon do
      tag.i nil, data: { feather: name }
    end
  end
end
