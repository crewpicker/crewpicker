class FlightscreensController < ApplicationController
  def show
    @stage_schedules = StageSchedule.find(:all, :conditions => ["stage_schedules.end >= ?", DateTime.now.advance(:minutes => 30)], :limit => 3)
    render :layout => false
  end
end
