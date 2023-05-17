class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :registrations
  has_many :events, through: :registrations

  after_create  :perform_creation_jobs

  private 
  def perform_creation_jobs 
      UserJob.perform_now(self) 
      CreateEmployeeJob.set(wait: 2.minutes).perform_later(self)                    
  end
end
