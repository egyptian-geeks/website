module TextHelper
  def format_message(message)
    formatted = simple_format(message)
    tag.div formatted, dir: :auto
  end
end
