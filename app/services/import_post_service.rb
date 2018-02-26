class ImportPostService < ApplicationService
  def initialize(content)
   @content = content
  end

  def call
    fid = content['id']
    post = Post.find_or_create_by(fid: fid) do |post|
      post.fid = fid
      post.message = content['message']&.force_encoding('UTF-8')
      post.link = content['link']
      post.picture = content['picture']
      post.name = content['name']
      post.type = content['type'].capitalize
      post.created_at = content['created_time']
      post.updated_at = content['updated_time']
      post.permalink_url = content['permalink_url']
      post.user = ImportUserService.call(content['from'])
    end
    ImportCommentService.call(post, content['comments']['data']) if content['comments'].present?
    ImportReactionService.call(post, content['reactions']['data']) if content['reactions'].present?
    ImportTagService.call(post) if post.message.present?

    return post
  end

  private

  attr_reader :content

end
