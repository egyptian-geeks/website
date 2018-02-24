class PageService < ApplicationService
  def initialize(collection, page, limit = 20)
    @collection = collection
    @page = page.present? ? page.to_i : 1
    @offset = @page.pred * limit
    @limit = limit
  end

  def call
    @collection = collection.offset(offset).limit(limit)
    OpenStruct.new(collection: collection, page: page, next_page: next_page, per_page: limit)
  end

  private

  def next_page
    page.next if collection.size == limit
  end

  attr_reader :collection, :page, :limit, :offset
end
