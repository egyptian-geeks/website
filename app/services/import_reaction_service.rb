class ImportReactionService < ApplicationService
  def initialize(post, reactions)
   @post = post
   @reactions = reactions
  end

  def call
    reactions.each do |reaction|
      fid = "#{post.fid}_#{reaction['id']}"
      Reaction.find_or_create_by(fid: fid) do |r|
        r.fid = fid
        r.type = reaction['type'].capitalize
        r.user = ImportUserService.call(reaction)
        r.post = post
      end
    end
  end

  private

  attr_reader :post, :reactions

end
