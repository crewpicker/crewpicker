# encoding: UTF-8
class FlightscreensController < ApplicationController
  def show
    @stage_schedules = StageSchedule.where("stage_schedules.end > ?", DateTime.now.to_formatted_s(:db)).limit(3).order("`id` DESC")
    render :layout => false
  end
  def now
    stage_schedule = StageSchedule.find(:all, :conditions => ["stage_schedules.end > ?", DateTime.now.to_formatted_s(:db)], :limit => 1, :order => "`id` DESC").first
    if stage_schedule
      bandname = stage_schedule.band.name
    else
      bandname = "I have no idea who is next"
    end
    render plain: bandname
  end
  def next
    stage_schedule = StageSchedule.find(:all, :conditions => ["stage_schedules.end > ?", DateTime.now.to_formatted_s(:db)], :limit => 2, :order => "`id` DESC").last
    if stage_schedule
      bandname = stage_schedule.band.name
    else
      bandname = "I have no idea who is next"
    end
    render plain: bandname
  end
  def later
    stage_schedule = StageSchedule.find(:all, :conditions => ["stage_schedules.end > ?", DateTime.now.to_formatted_s(:db)], :limit => 3, :order => "`id` DESC").last
    if stage_schedule
      bandname = stage_schedule.band.name
    else
      bandname = "I have no idea who is next"
    end
    render plain: bandname
  end
end
