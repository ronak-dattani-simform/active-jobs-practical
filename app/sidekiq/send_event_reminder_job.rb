class SendEventReminderJob
  include Sidekiq::Job

  def perform(*args)
    @events = Event.where(event_time: DateTime.now+ 5.hours)
    if @events.size > 0 
      @events.each do |event| 
        EventMailer.event_reminder(event).deliver_now
      end
    end
  end
end
