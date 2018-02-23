class Tag < ApplicationRecord
  validates_presence_of :title
  validates_uniqueness_of :title, case_sensitive: false

  has_many :post_tags, dependent: :destroy
  has_many :posts,     through: :post_tags
end
