class ChartsController < ApplicationController

  # GET /charts
  def index
  end

  # GET /charts/posts
  def posts
    params[:range] ||= 'year'
    @data = Post.chart_data(params[:range])
    render template: 'charts/shared/line-chart', locals: {type: 'Posts', data: @data, range: params[:range]}
  end

end
