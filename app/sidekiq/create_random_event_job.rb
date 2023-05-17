class CreateRandomEventJob
  include Sidekiq::Job

  def perform(*args)
    event = Event.new(
      title: Faker::Lorem.sentence,
      event_time: Faker::Time.forward(days: 30),
      description: Faker::Lorem.paragraph
    )
    event.save
  end
end
