class Tag < ApplicationRecord
  validates_presence_of :title
  validates_uniqueness_of :title, case_sensitive: false

  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags

  scope :order_by_most_posts, -> { unscoped.order(posts_count: :desc) }

  alias_attribute :to_param, :title
end
