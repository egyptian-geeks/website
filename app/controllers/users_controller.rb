class UsersController < ApplicationController
  include PageableConcern
  before_action :set_user, only: :show

  # GET /users
  def index
    @users = paginate User.order_by_most(params[:order_by])
  end

  # GET /users/1
  def show
    @posts = paginate @user.posts
  end

  private

  def set_user
    @user = User.find_by!(fid: params[:id])
  end
end
