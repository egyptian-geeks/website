module IconsHelper
  def icon(name)
    tag.i nil, class: 'align-middle', data: { feather: name }
  end
end
