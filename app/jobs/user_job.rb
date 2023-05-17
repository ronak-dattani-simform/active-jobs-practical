class UserJob < ApplicationJob
  queue_as :default

  def perform(user)
    @user = user
    UserMailer.welcome_mail(@user).deliver_now
  end
end
