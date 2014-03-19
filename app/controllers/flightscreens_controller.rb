# encoding: UTF-8
class FlightscreensController < ApplicationController
  def show
    @stage_schedules = StageSchedule.find(:all, :conditions => ["stage_schedules.end > ?", DateTime.now.to_formatted_s(:db)], :limit => 3, :order => "`id` DESC")
    render :layout => false
  end
  def now
    stage_schedule = StageSchedule.find(:all, :conditions => ["stage_schedules.end > ?", DateTime.now.to_formatted_s(:db)], :limit => 1, :order => "`id` DESC").first
    bandname = stage_schedule.band.name or "I have no idea who is next"
    render :text => bandname, :content_type => Mime::TEXT
  end
  def next
    stage_schedule = StageSchedule.find(:all, :conditions => ["stage_schedules.end > ?", DateTime.now.to_formatted_s(:db)], :limit => 2, :order => "`id` DESC").last
    bandname = stage_schedule.band.name or "I have no idea who is next"
    render :text => bandname, :content_type => Mime::TEXT
  end
  def later
    stage_schedule = StageSchedule.find(:all, :conditions => ["stage_schedules.end > ?", DateTime.now.to_formatted_s(:db)], :limit => 3, :order => "`id` DESC").last
    bandname = stage_schedule.band.name or "I have no idea who is next"
    render :text => bandname, :content_type => Mime::TEXT
  end
end
