class FlightscreenController < ApplicationController
  def index
    @location_schedules = LocationSchedule.all
  end
end
