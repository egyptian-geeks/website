class PageService < ApplicationService
  def initialize(model, limit, before)
    @model = model
    @limit = limit
    @before = before || Time.zone.now
  end

  def call
    model
      .order(created_at: :desc)
      .where('created_at < ?', before)
      .limit(limit)
  end

  private

  attr_reader :model, :limit, :before
end
