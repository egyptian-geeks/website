class ImportPostService < ApplicationService
  def initialize(content)
   @content = content
  end

  def call
    fid = content['id']
    post = Post.find_or_create_by(fid: fid) do |post|
      post.fid = fid
      post.message = content['message']
      post.link = content['link']
      post.picture = content['picture']
      post.name = content['name']
      post.type = content['type'].capitalize
      post.created_at = content['created_time']
      post.updated_at = content['updated_time']
      post.permalink_url = content['permalink_url']
      post.user = ImportUserService.call(content['from'])
    end
    import_comments(post, content['comments']['data']) if content['comments'].present?
    import_reactions(post, content['reactions']['data']) if content['reactions'].present?

    return post
  end

  private

  attr_reader :content

  def import_comments(post, comments)
    comments.each do |comment|
      fid = comment['id']
      Comment.find_or_create_by(fid: fid) do |c|
        c.fid = fid
        c.message = comment['message']
        c.created_at = comment['created_time']
        c.user = ImportUserService.call(comment['from'])
        c.post = post
      end
    end
  end

  def import_reactions(post, reactions)
    reactions.each do |reaction|
      fid = "#{post.fid}_#{reaction['id']}"
      Reaction.find_or_create_by(fid: fid) do |r|
        r.fid = fid
        r.type = reaction['type'].capitalize
        r.user = ImportUserService.call(reaction)
        r.post = post
      end
    end
  end
end
