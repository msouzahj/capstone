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
			   		   #@hash["#{event.name}"] = event.results
    @my_hash = Hash.new
	@user.seasons.each do |season|
		season.meets.each do |meet|
			meet.events.each do |event|
			   if @my_hash.empty?
			  	@my_hash.store("#{event.name}",event.results)	
			   elsif @my_hash.has_key?("#{event.name}") == false
				@my_hash.store("#{event.name}",event.results)

			   elsif @my_hash.has_key?("#{event.name}") == true	
		 	    if (event.name == "High Jump" || event.name == "Long Jump" || event.name == "Triple Jump" || event.name =="Pole Vault" ||event.name == "Shot Put" || event.name == "Weight Throw" ||event.name == "Discus Throw" || event.name =="Javelin Throw" || event.name =="Hammer Throw")
				if event.results != "NH"
			
			 	     @my_hash.keys.each do |key|
				       if key.to_s == event.name.to_s
                                        if event.results.to_f > @my_hash[key].to_f
                                           @my_hash[key] = event.results
                                        elsif event.results.to_f <= @my_hash[key].to_f 
					   @my_hash[key] = @my_hash[key]
					end
				       end	
				      end
				end
			     elsif (event.name == "100m" || event.name == "200m" || event.name == "100mH" || event.name == "50m" || event.name == "55m" || event.name == "60m" || event.name == "50mH" || event.name == "55mH" || event.name =="60mH" || event.name == "400m" || event.name == "400mH" || event.name == "100mH")
				if event.results != "DNF"
				    @my_hash.keys.each do |key|
			              if key.to_s == event.name.to_s
                                        if  @my_hash[key] > event.results
						@my_hash[key] = event.results
					elsif @my_hash[key] <= event.results
					   @my_hash[key] = @my_hash[key]
					end
				      end
				    end
				end
                             else
				if event.results != "DNF"
				    @my_hash.keys.each do |key|
			              if key.to_s == event.name.to_s
                                        if  @my_hash[key] > event.results
					   @my_hash[key] = event.results
					elsif @my_hash[key] <= event.results
					   @my_hash[key] = @my_hash[key]
					end
				      end
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
