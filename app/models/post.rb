class Post < ApplicationRecord
  validates_presence_of :type, :permalink_url, :fid, :user
  validates_uniqueness_of :permalink_url, :fid

  belongs_to :user, counter_cache: true
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  alias_attribute :to_param, :fid

  def self.chart_data(range)
    case range
    when 'year'
      range = "%Y"
    when 'month'
      range = "%Y-%m"
    when 'day'
      range = "%Y-%m-%d"
    end
    group("strftime('#{range}', created_at)")
    .count.sort{ |d| Date.strptime(d[0], range) }.reverse
    .map {|d| {date: d[0], count: d[1]} }.to_json
  end
end
