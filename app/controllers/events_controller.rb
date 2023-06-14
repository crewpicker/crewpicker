class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  filter_resource_access
  layout :check_layout

  # GET /events
  def index
    @events = Event.all
  end

  # GET /events/1
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      if event_params[:set_as_active_event]
        active_event = ActiveEvent.first_or_create
        active_event.event = @event
        active_event.save
      end
      redirect_to events_path, notice: 'Event was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      if event_params[:set_as_active_event]
        active_event = ActiveEvent.first_or_create
        active_event.event = @event
        active_event.save
      end
      redirect_to events_path, notice: 'Event was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:name,:from,:to,:band_deadline,:volunteer_deadline,:set_as_active_event)
    end
end
