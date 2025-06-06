class HabitsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_habit, only: %i[show edit update destroy]

  def index
    @habits = current_user.habits.includes(:habit_checkins)
    today = Date.today
  
    @today_checkins = HabitCheckin.where(habit_id: @habits.pluck(:id), date: today).index_by(&:habit_id)
    
    @checkins_by_date = HabitCheckin.all.group_by(&:habit_id).transform_values do |checkins|
      checkins.map(&:date)
    end
  end

  def show
    @start_date = @habit.created_at.to_date
    @end_date = Date.today
    @checkins = @habit.habit_checkins.index_by(&:date)
  end

  def new
    @habit = current_user.habits.build
  end

  def create
    @habit = current_user.habits.build(habit_params)
    if @habit.save
      redirect_to habits_path, notice: 'Habit created successfully.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @habit.update(habit_params)
      redirect_to habits_path, notice: 'Habit updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @habit.destroy
    redirect_to habits_path, notice: 'Habit deleted successfully.'
  end

  private

  def get_habit
    @habit = current_user.habits.find(params[:id])
  end

  def habit_params
    params.require(:habit).permit(:name, :description)
  end
end
