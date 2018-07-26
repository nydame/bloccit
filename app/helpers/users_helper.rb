module UsersHelper
  def has_posts
    @user.posts.count > 0
  end
  def has_comments
    @user.comments.count > 0
  end
end
