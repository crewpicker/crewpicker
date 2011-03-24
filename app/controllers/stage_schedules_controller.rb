class StageSchedulesController < ApplicationController
  layout 'calendar'
  def get_events
    stage_schedules = Stage.find(params[:id]).stage_schedules
    events = []
    stage_schedules.each do |stage_schedule|
      events << {:id => stage_schedule.band.uuid, :title => stage_schedule.band.name, :start => "#{stage_schedule.from.iso8601}", :end => "#{stage_schedule.to.iso8601}", :allDay => false, :recurring => false}
    end
    render :text => events.to_json
  end
  def show_schedule
    bands = Band.all
    @events = []
    bands.each do |band|
      if !band.stage_schedule
        @events << band
      end
    end
    @stage = Stage.find(params[:id])
  end
  def create
    band = Band.find(params[:band_id])
    stage = Stage.find(params[:id])
    stage_schedule = StageSchedule.new
    band.stage_schedule = stage_schedule
    stage_schedule.from = DateTime.civil(params[:year].to_i, params[:month].to_i, params[:day].to_i, params[:hour].to_i, params[:minute].to_i)
    stage_schedule.to = DateTime.civil(params[:year].to_i, params[:month].to_i, params[:day].to_i, params[:hour].to_i, params[:minute].to_i+15)
    stage.stage_schedules << stage_schedule
    stage_schedule.save
  end
  def move
    band = Band.find(params[:band_id])
    stage_schedule = band.stage_schedule
    stage_schedule.from = stage_schedule.from.advance(:days => params[:day_delta].to_i, :minutes => params[:minute_delta].to_i)
    stage_schedule.to = stage_schedule.to.advance(:days => params[:day_delta].to_i, :minutes => params[:minute_delta].to_i)
    stage_schedule.save
  end
end
