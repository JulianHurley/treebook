class UserMailer < ActionMailer::Base
  default from: "jimbolooney62@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
