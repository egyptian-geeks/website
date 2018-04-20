class ChartsController < ApplicationController

  # GET /charts
  def index
  end

  # GET /charts/posts
  def posts
  end

  # GET /charts/get_posts_count
  def get_posts_count
    data = Post.group('strftime("%Y", created_at)')
               .count.sort{ |d| Date.strptime(d[0], '%y') }.reverse
               .map {|d| {date: d[0], count: d[1]} }

    render json: data, status: 200
  end

end
