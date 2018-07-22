
class UserMailer < ApplicationMailer::Base
  default from: "luket.chavez@gmail.com"

  def new_user(user)
    @user = user
    mail(to: user.email, subject: "Welcome to Blocipedia!")
  end
end
