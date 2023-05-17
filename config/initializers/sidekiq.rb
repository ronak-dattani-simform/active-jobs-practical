
Sidekiq.configure_server do |config|
  config.on(:startup) do
    schedule_file = "config/scheduler.yml"

    if File.exist?(schedule_file)
      Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
    end
  end
end


# inside config/initializers/sidekiq.rb
# require "sidekiq"
# require "sidekiq-cron"

# Sidekiq::Cron::Job.create(
#   name: "Create Random Event",
#   cron: "* * * * *",
#   class: "CreateRandomEventJob",
# )

# Sidekiq::Cron::Job.create(
#   name: "send events reminder",
#   cron: "0 0 * * *",
#   class: "SendEventReminderJob",
# )

# Sidekiq::Cron::Job.create(
#   name: "send list",
#   cron: "0 0 * * *",
#   class: "SendListJob",
# )
