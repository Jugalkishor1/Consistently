class Habit < ApplicationRecord
  belongs_to :user
  has_many :habit_checkins, dependent: :destroy

  validates :name, presence: true

  def checkin_dates
    habit_checkins.pluck(:date)
  end
  
  def current_streak
    streak = 0
    date = Date.today
  
    while habit_checkins.exists?(date: date)
      streak += 1
      date -= 1
    end
  
    streak
  end
  
  def longest_streak
    dates = checkin_dates.sort
    longest = temp = 1
  
    dates.each_cons(2) do |a, b|
      if b == a + 1
        temp += 1
      else
        longest = [longest, temp].max
        temp = 1
      end
    end
  
    [longest, temp].max
  end
  
  def consistency_percentage
    total_days = (Date.today - created_at.to_date).to_i + 1
    return 0 if total_days.zero?
  
    ((checkin_dates.count.to_f / total_days) * 100).round
  end
  
end
