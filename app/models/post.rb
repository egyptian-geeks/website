class Post < ApplicationRecord
  validates_presence_of :type, :permalink_url, :fid
  validates_uniqueness_of :permalink_url, :fid
end
