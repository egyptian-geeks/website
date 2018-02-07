class ImportCommentService < ApplicationService
  def initialize(post, comments)
   @post = post
   @comments = comments
  end

  def call
    comments.each do |comment|
      fid = comment['id']
      Comment.find_or_create_by(fid: fid) do |c|
        c.fid = fid
        c.message = comment['message']&.force_encoding('UTF-8')
        c.created_at = comment['created_time']
        c.user = ImportUserService.call(comment['from'])
        c.post = post
      end
    end
  end

  private

  attr_reader :post, :comments

end
