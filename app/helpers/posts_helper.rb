module PostsHelper

  # Returns iframe url to embed a post in page
  def facebook_post_url(post)
    href = "https://www.facebook.com/#{post.fid.gsub('_', '/posts/')}"
    "https://www.facebook.com/plugins/post.php?href=#{CGI.escape(href)}&width=auto&show_text=true&height=524"
  end
end
