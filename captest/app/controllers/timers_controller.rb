class TimersController < ApplicationController
  before_action :set_timer, only: [:show, :edit, :update, :destroy]

  def index
    @timers = Timer.all
       @my_time = current_user.timers
    @saved = Array.new
  end

  def show
  end

  def new
    @timer = Timer.new
  end

  def edit
  end

  def create
    @timer = Timer.new(timer_params)
    @timer.save
    respond_with(@timer)
  end

  def update
    @timer.update(timer_params)
    respond_with(@timer)
  end

  def destroy
    @timer.destroy
    respond_with(@timer)
  end

  private
    def set_timer
      @timer = Timer.find(params[:id])
    end

    def timer_params
      params.require(:timer).permit(:saved_times, :user_id)
    end
end
