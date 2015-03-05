class SeasonsController < ApplicationController
  before_action :set_season, only: [:show, :edit, :update, :destroy]

  def index
    @seasons = Season.all
    if user_signed_in?
	@my_season = current_user.seasons
    end
  end

  def show
  end

  def new
    @season = current_user.seasons.new
  end

  def edit
    @season = Season.find(params[:id])
  end

  def create
    @season = Season.new(season_params)
    @season.user_id = current_user.id
    if @season.save
    	redirect_to season_meets_path(@season)
    else
    	render :new
    end
  end

  def update
    if @season.update(season_params)
    redirect_to @season
    else
    render :edit
    end
  end

  def destroy
    @season.destroy
    redirect_to seasons_url
  end

  private
    def set_season
      @season = Season.find(params[:id])
    end

    def season_params
      params.require(:season).permit(:season, :year, meets_attributes: [:name, :date, :notes, :season])
    end
end
