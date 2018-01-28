module UsersHelper
  def user_avatar(user)
    "http://graph.facebook.com/#{user.fid}/picture?type=square"
  end
end
