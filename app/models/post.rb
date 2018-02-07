class Post < ApplicationRecord
  validates_presence_of :type, :permalink_url, :fid, :user
  validates_uniqueness_of :permalink_url, :fid

  belongs_to :user
  has_many :comments
  has_many :reactions

  alias_attribute :to_param, :fid
end
