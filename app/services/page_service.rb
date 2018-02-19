class PageService < ApplicationService
  def initialize(model, limit, before, order_by=nil)
    @model = model
    @limit = limit
    @order_by = order_by
    @before = before || Time.zone.now
  end

  def call
    if ['posts_count', 'comments_count', 'reactions_count'].include?(order_by)
      model.order_by_most(order_by)
    else
      model.order(created_at: :desc)
      .where('created_at < ?', before)
    end
      .limit(limit)
  end

  private

  attr_reader :model, :limit, :before, :order_by
end
