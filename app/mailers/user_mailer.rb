class UserMailer < ApplicationMailer
    default from: "mymail@example.com"
    
    def welcome_mail(user)
        @user = user
        mail(to: @user.email, subject: "Welcome to example.com")
    end

end
