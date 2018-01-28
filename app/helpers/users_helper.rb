module UsersHelper
  def user_avatar(user)
    "http://graph.facebook.com/#{user.fid}/picture?type=square"
  end

  def user_facebook_profile(user)
    "https://www.facebook.com/#{user.fid}"
  end
end
