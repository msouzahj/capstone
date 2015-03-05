class MeetsController < ApplicationController
  before_action :set_meet, only: [:show, :edit, :update, :destroy]

  def index
    @season = Season.find params[:season_id]
    @meets = Meet.all
    @my_meets = @season.meets.all
    @number = 1
  end

  def show 	
	
  end

  def new
    @season = Season.find params[:season_id]
    @meet = @season.meets.new
    #respond_with(@meet)
  end

  def edit
	@meet = Meet.find(params[:id])
  end

  def create
    @season = Season.find params[:season_id]
    @meet = @season.meets.new(meet_params)
    @meet.season_id = @season.id
     
    if @meet.save
       redirect_to season_meets_path(@season)
    else
       render :new
    end
  end

  def update
    if @meet.update(meet_params)
    redirect_to season_meets_url(@meet.season)
    else
    render :edit
    end
  end

  def destroy
    @meet.destroy
    redirect_to season_meets_url(@meet.season)
  end

  private
    def set_meet
      @meet = Meet.find(params[:id])
    end

    def meet_params
      params.require(:meet).permit(:name, :date, :notes, :season_id)
    end
end
