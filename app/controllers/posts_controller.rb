class PostsController < ApplicationController
  before_action :set_post, only: :show

  # GET /posts
  def index
    @posts = page
    @next_page = page.last.created_at if next_page?
  end

  # GET /posts/1
  def show; end

  private

  def set_post
    @post = Post.find_by!(fid: params[:id])
  end

  def page
    @page ||= PageService.call(Post, 20, params[:before])
  end

  def next_page?
    page.size == 20
  end
end
