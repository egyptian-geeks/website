class Post < ApplicationRecord
  validates_presence_of :type, :permalink_url, :fid, :user
  validates_uniqueness_of :permalink_url, :fid

  belongs_to :user, counter_cache: true
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  alias_attribute :to_param, :fid
end
