class WeeklySummaryJob < ApplicationJob
  queue_as :default

  def perform
    User.find_each do |user|
      UserMailer.weekly_summary(user).deliver_later
    end
  end
end
