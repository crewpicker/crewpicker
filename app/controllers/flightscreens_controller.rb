class FlightscreensController < ApplicationController
  def show
    @stage_schedules = StageSchedule.find(:all, :conditions => ["stage_schedules.to >= ?", DateTime.now.advance(:hours => 1, :minutes => 35)], :limit => 5)
    render :layout => false
  end
end
