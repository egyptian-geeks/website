class PostTag < ApplicationRecord
  validates_presence_of :tag, :post

  belongs_to :tag, counter_cache: :posts_count
  belongs_to :post
end
