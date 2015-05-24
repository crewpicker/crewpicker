class ActiveEventsController < ApplicationController
  before_action :set_active_event, only: [:show, :edit, :update, :destroy]

  # GET /active_events
  def index
    @active_events = ActiveEvent.all
  end

  # GET /active_events/1
  def show
  end

  # GET /active_events/new
  def new
    @active_event = ActiveEvent.new
  end

  # GET /active_events/1/edit
  def edit
  end

  # POST /active_events
  def create
    @active_event = ActiveEvent.new(active_event_params)

    if @active_event.save
      redirect_to @active_event, notice: 'Active event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /active_events/1
  def update
    if @active_event.update(active_event_params)
      redirect_to @active_event, notice: 'Active event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /active_events/1
  def destroy
    @active_event.destroy
    redirect_to active_events_url, notice: 'Active event was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_active_event
      @active_event = ActiveEvent.all.first
    end

    # Only allow a trusted parameter "white list" through.
    def active_event_params
      params.require(:active_event).permit(:event_id)
    end
end
