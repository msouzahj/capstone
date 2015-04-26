class SeasonsController < ApplicationController
  before_action :set_season, only: [:show, :edit, :update, :destroy]

  def index
    @seasons = Season.all
    if user_signed_in?
	@my_season = current_user.seasons
    end
  end
  
  def history
	@user = current_user
	#add all results for season specific then give option for past results as well.
  end
  def best
	@user = current_user

    @hash = Hash.new
	@user.seasons.each do |season|
		season.meets.each do |meet|
			meet.events.each do |event|
			   @hash["#{event.name}"] = event.results

		end
	end
      end
        @user.seasons.each do |season|
                season.meets.each do |meet|
                        meet.events.each do |event|
                          @hash.each do |key, value|
                             #if key.to_s == event.name.to_s
                             #     value = event.results
                             #end
			     if (event.name == "High Jump" || event.name == "Long Jump" || event.name == "Triple Jump" || event.name =="Pole Vault" ||event.name == "Shot Put" || event.name == "Weight Throw" ||event.name == "Discus" || event.name =="Javelin")
                                if key.to_s == event.name.to_s
                                        if value.to_f < event.results.to_f
                                           value = event.results
                                        end
                                end                             
			    else
                                if key.to_s == event.name.to_s
                                        if value > event.results
                                           value = event.results
                                        end
                                end 
			    end
                          end

                end
        end
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
