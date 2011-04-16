class FlightscreensController < ApplicationController
  def show
    @stage_schedules = StageSchedule.find(:all, :conditions => ["stage_schedules.to >= ?", DateTime.now.advance(:hours => 2, :minutes => 15)], :limit => 5)
    render :layout => false
  end
end
