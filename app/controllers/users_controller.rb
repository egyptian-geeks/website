class UsersController < ApplicationController
  include PageableConcern
  before_action :set_user, only: :show

  # GET /users
  def index
    @order_options = {
      'Order by' => '',
      'Posts' => 'posts_count',
      'Comments' => 'comments_count',
      'Reactions' => 'reactions_count'
    }
    @users = OrderService.call(User, params[:order_by])
    @users = SearchService.call(@users, :name, params[:keyword])
    @users = paginate(@users)
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
