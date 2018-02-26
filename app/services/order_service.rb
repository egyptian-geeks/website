class OrderService < ApplicationService
  def initialize(collection, column = :created_at, order = :desc)
    @collection = collection
    @column = column.present? ? column : :created_at
    @order = order
  end

  def call
    collection.order(column => order)
  end

  private

  attr_reader :collection, :column, :order
end
