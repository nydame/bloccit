class FavoriteMailer < ApplicationMailer
  default from: "fmbetancourt@gmail.com"

  def new_comment(user, post, comment)
    headers['Message-ID'] = "<comments/#{comment.id}@warm-temple-57423.herokuapp.com>"
    headers['In-Reply-To'] = "<post/#{post.id}@warm-temple-57423.herokuapp.com>"
    headers['References'] = "<post/#{post.id}@warm-temple-57423.herokuapp.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")

  end
end
