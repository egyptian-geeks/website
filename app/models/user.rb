class User < ApplicationRecord
  validates_presence_of :name, :fid
  validates_uniqueness_of :fid

  has_many :posts
end
