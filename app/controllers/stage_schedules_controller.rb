class StageSchedulesController < ApplicationController
  filter_resource_access
  layout :check_layout

  def get_events
    stage_schedules = Stage.find(params[:id]).stage_schedules
    events = []
    stage_schedules.each do |stage_schedule|
      events << {:id => stage_schedule.band.uuid, :title => stage_schedule.band.name, :start => "#{stage_schedule.start.iso8601}", :end => "#{stage_schedule.end.iso8601}", :allDay => false, :recurring => false}
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
    if params[:id]
      @stage = Stage.find(params[:id])
    elsif params[:name]
      @stage = Stage.find_by_name(params[:name].capitalize)
    end
  end
  def create
    band = Band.find(params[:band_id])
    stage = Stage.find(params[:id])
    stage_schedule = StageSchedule.new
    band.stage_schedule = stage_schedule
    stage_schedule.start = DateTime.civil(params[:year].to_i, params[:month].to_i, params[:day].to_i, params[:hour].to_i, params[:minute].to_i)
    stage_schedule.end = DateTime.civil(params[:year].to_i, params[:month].to_i, params[:day].to_i, params[:hour].to_i, params[:minute].to_i)
    stage_schedule.end = stage_schedule.end.advance(:minutes => 15)
    stage.stage_schedules << stage_schedule
    stage_schedule.save
  end
  def move
    band = Band.find(params[:band_id])
    stage_schedule = band.stage_schedule
    stage_schedule.start = stage_schedule.start.advance(:days => params[:day_delta].to_i, :minutes => params[:minute_delta].to_i)
    stage_schedule.end = stage_schedule.end.advance(:days => params[:day_delta].to_i, :minutes => params[:minute_delta].to_i)
    stage_schedule.save
  end
  def delete
    band = Band.find(params[:event_id])
    stage_schedule = band.stage_schedule
    stage_schedule.destroy
    render :update do |page|
      page<<"$('#calendar').fullCalendar( 'refetchEvents' )"
    end
  end
end
