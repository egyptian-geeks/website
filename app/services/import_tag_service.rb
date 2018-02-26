class ImportTagService < ApplicationService
  def initialize(post)
   @post = post
  end

  def call
    tags = post.message.scan(/(?:\s|^)(?:#(?!\d+(?:\s|$)))(\w+)(?=\s|$)/i).flatten.map(&:downcase) # TODO : Handle Arabic Hashtags

    unless tags.empty?
      tags = tags.map { |t| Tag.find_or_create_by(title: t) }

      post.tags |= tags
    end

    return tags
  end

  private

  attr_reader :post

end
