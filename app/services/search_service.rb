class SearchService < ApplicationService
  def initialize(collection, column, keyword)
    @collection = collection
    @column = column
    @keyword = keyword.present? ? keyword : nil
  end

  def call
    return @collection unless keyword
    collection.where("#{column} LIKE ?", "%#{keyword}%")
  end

  private

  attr_reader :collection, :column, :keyword
end
