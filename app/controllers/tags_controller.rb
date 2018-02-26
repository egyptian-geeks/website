class TagsController < ApplicationController
  include PageableConcern
  before_action :set_tag, only: :show

  # GET /tags
  def index
    @tags = OrderService.call(Tag, :posts_count)
    @tags = SearchService.call(@tags, :title, params[:keyword])
    @tags = paginate(@tags, 10000)
  end

  # GET /tags/1
  def show
    @posts = OrderService.call(@tag.posts)
    @posts = paginate(@posts)
  end

  private

  def set_tag
    @tag = Tag.find_by!(title: params[:id])
  end
end
