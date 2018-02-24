class PostsController < ApplicationController
  include PageableConcern
  before_action :set_post, only: :show

  # GET /posts
  def index
    @posts = OrderService.call(Post, :created_at)
    @posts = paginate(@posts)
  end

  # GET /posts/1
  def show; end

  private

  def set_post
    @post = Post.find_by!(fid: params[:id])
  end
end
