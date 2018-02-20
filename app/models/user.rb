class User < ApplicationRecord
  validates_presence_of :name, :fid
  validates_uniqueness_of :fid

  has_many :posts
  has_many :comments
  has_many :reactions

  scope :order_by_most, ->(column) { column.present? ? unscoped.order(column => :desc) : all }

  alias_attribute :to_param, :fid
end
