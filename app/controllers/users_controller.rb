class UsersController < ApplicationController
  before_action :set_user, only: :show

  # GET /users
  def index
    @users = page
    @next_page = params[:page].next if next_page?
  end

  # GET /users/1
  def show
    @posts = posts_page
    @next_posts_page = params[:page].next if next_posts_page?
  end

  private

  def set_user
    @user = User.find_by!(fid: params[:id])
  end

  def page
    @page ||= PageService.call(User.order_by_most(params[:order_by]), params[:page], 20)
  end

  def next_page?
    page.size == 20
  end

  def posts_page
    @posts_page ||= PageService.call(@user.posts, params[:page], 20)
  end

  def next_posts_page?
    posts_page.size == 20
  end
end
