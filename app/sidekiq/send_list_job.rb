class SendListJob
  include Sidekiq::Job

  def perform(*args)
    users = User.all
      users.each do|user|
        EventMailer.event_list(user).deliver_now
      end 
  end
end
