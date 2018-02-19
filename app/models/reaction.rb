class Reaction < ApplicationRecord
  # fid is "#{post.fid}_#{user.fid}", beacause reactions don't have uniq fid provideid in the API
  validates_presence_of :type, :fid, :user, :post
  validates_uniqueness_of :fid

  belongs_to :user, counter_cache: true
  belongs_to :post, counter_cache: true
end
