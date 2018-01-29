class ImportUserService < ApplicationService

  def initialize(content)
    @content = content
  end

  def call
    fid = content['id']
    User.find_or_create_by(fid: fid) do |user|
      user.fid = fid
      user.name = content['name']
    end
  end

  private

  attr_reader :content
end
