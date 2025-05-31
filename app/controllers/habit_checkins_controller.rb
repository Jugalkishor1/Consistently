class HabitCheckinsController < ApplicationController
    before_action :authenticate_user!
    before_action :get_habit
  
    def create
      @habit.habit_checkins.create(date: params[:date])
      redirect_to habits_path, notice: "Habit marked as done for #{params[:date]}"
    end
  
    def destroy
      checkin = @habit.habit_checkins.find(params[:id])
      checkin.destroy
      redirect_to habits_path, notice: "Check-in removed"
    end
  
    private
  
    def get_habit
      @habit = current_user.habits.find(params[:habit_id])
    end
  end
  