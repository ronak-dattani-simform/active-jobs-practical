class EventMailer < ApplicationMailer
    default from: "mymail@example.com"
    
    def event_list(user)
        # user = params[:user]
        @events = user.events
        mail(to: user.email, subject: "Here is list of Event you have registered.")
    end

    def event_reminder(event)
        emails = @event.users.pluck(:email)
        mail(to: emails, subject: "Reminder mail")
    end
end
