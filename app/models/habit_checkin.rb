class HabitCheckin < ApplicationRecord
  belongs_to :habit
  
  validates :date, presence: true
  validates :date, uniqueness: { scope: :habit_id, message: "already checked in for this day" }  
end