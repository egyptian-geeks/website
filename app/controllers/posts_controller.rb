class PostsController < ApplicationController
  include PageableConcern
  before_action :set_post, only: :show

  # GET /posts
  def index
    @posts = paginate Post
  end

  # GET /posts/1
  def show; end

  private

  def set_post
    @post = Post.find_by!(fid: params[:id])
  end
end
