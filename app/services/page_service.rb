class PageService < ApplicationService
  def initialize(collection, page, limit=20)
    @collection = collection
    @page = page
    @offset = page.pred*limit
    @limit = limit
  end

  def call
    collection.offset(offset).limit(limit)
  end

  private

  attr_reader :collection, :page, :limit, :offset
end
