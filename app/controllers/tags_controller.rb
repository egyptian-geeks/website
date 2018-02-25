class TagsController < ApplicationController
  include PageableConcern
  before_action :set_tag, only: :show

  # GET /tags
  def index
    @tags = paginate Tag.order_by_most_posts, 10000
  end

  # GET /tags/1
  def show
    @posts = paginate @tag.posts
  end

  private

  def set_tag
    @tag = Tag.find_by!(title: params[:id])
  end
end
