class CreateEmployeeJob < ApplicationJob
  queue_as :default

  def perform(user)
    @user = user
    Employee.create(email: @user.email)
  end
end
