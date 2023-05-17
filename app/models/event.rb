class Event < ApplicationRecord

    validates :title, :description, :event_time, presence: true
    has_many :registrations
    has_many :users, through: :registrations


end
