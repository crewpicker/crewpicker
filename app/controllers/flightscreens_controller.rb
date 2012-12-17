# encoding: UTF-8
class FlightscreensController < ApplicationController
  def show
    @stage_schedules = StageSchedule.find(:all, :conditions => ["stage_schedules.end > ?", DateTime.now.to_formatted_s(:db)], :limit => 3)
    render :layout => false
  end
end
