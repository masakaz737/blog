class CreateMailer < ApplicationMailer
  def create_mail(blog)
    @blog = blog
    @user_email = @blog.user.email

    mail to: @user_email, subject: "ブログ作成完了メール"
  end
end
