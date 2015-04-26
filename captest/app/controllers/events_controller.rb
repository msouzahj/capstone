class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    #@season = Season.find params[:season_id]
    @meet = Meet.find params[:meet_id]
    @events = Event.all
    @my_events = @meet.events.all
    #respond_with(@events)
  end

  def test
    @specific = params[:param1]
    @user = current_user
  end

  def show
    
  end

  def new
    @meet = Meet.find params[:meet_id] 
    @event = @meet.events.new
    #respond_with(@event)
  end

  def edit
	@event = Event.find(params[:id])
#	@season_type = @event.meet.season.season
  end

  def create
    @meet = Meet.find params[:meet_id]
    @event = @meet.events.new(event_params)
    @meet.id = @event.meet_id
#    @event.results = @event.results.gsub(/\w/, '')
    unless @event.results.include?"."
        @event.results = @event.results + ".00"
    end

    if @event.save
	redirect_to meet_events_path
    else
	render :new
    end
  end

  def update
    if @event.update(event_params)
	redirect_to meet_events_url(@event.meet)
    else
	render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to meet_events_url(@event.meet)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :results, :meet_id)
    end
end
