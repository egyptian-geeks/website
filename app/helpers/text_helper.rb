module TextHelper
  def format_message(message)
    return if message.blank?

    formatted = simple_format(message)
    tag.div formatted, dir: :auto
  end
end
