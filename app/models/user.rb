class User < ApplicationRecord
  validates_presence_of :name, :fid
  validates_uniqueness_of :fid

  has_many :posts
  has_many :comments
  has_many :reactions

  alias_attribute :to_param, :fid
end
