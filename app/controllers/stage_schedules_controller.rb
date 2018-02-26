# encoding: UTF-8
class StageSchedulesController < ApplicationController
  layout :check_layout

  def show
    stage_schedules = Stage.find(params[:stage_id]).stage_schedules
    events = []
    stage_schedules.each do |stage_schedule|
      if band = Band.find(stage_schedule.band_id)
        events << {:id => band.id, :title => band.name, :start => "#{stage_schedule.start.iso8601}", :end => "#{stage_schedule.end.iso8601}"}
      else
        stage_schedule.destroy
      end
    end
    render :json => events
  end

  def index
    bands = Band.all
    @events = []
    bands.each do |band|
      if !band.stage_schedule
        @events << band
      end
    end
    if params[:stage_id]
      @stage = Stage.find(params[:stage_id])
    elsif params[:name]
      @stage = Stage.find_by(name: params[:name].capitalize)
    else
      logger.warn("STAGE NOT FOUND")
    end
  end
  def print
    @stages = Stage.all
  end
  def create
    band = Band.find(params[:band_id])
    stage = Stage.find(params[:stage_id])
    stage_schedule = StageSchedule.new
    band.stage_schedule = stage_schedule
    stage_schedule.start = DateTime.civil(params[:year].to_i, params[:month].to_i, params[:day].to_i, params[:hour].to_i, params[:minute].to_i)
    stage_schedule.end = DateTime.civil(params[:year].to_i, params[:month].to_i, params[:day].to_i, params[:hour].to_i, params[:minute].to_i)
    stage_schedule.end = stage_schedule.end.advance(:minutes => 5)
    stage.stage_schedules << stage_schedule
    stage_schedule.save
    render nothing: true
  end
  def update
    band = Band.find(params[:band_id])
    stage_schedule = band.stage_schedule
    if params[:day_delta]
      stage_schedule.start = stage_schedule.start.advance(:days => params[:day_delta].to_i, :minutes => params[:minute_delta].to_i)
      stage_schedule.end = stage_schedule.end.advance(:days => params[:day_delta].to_i, :minutes => params[:minute_delta].to_i)
    else
      stage_schedule.end = stage_schedule.end.advance(:days => params[:day_res_delta].to_i, :minutes => params[:minute_res_delta].to_i)
    end
    stage_schedule.save
    render nothing: true
  end
  def destroy
    band = Band.find(params[:id])
    stage_schedule = band.stage_schedule
    stage_schedule.destroy
    respond_to do |format|
      format.js
    end
  end

  private

    def stage_schedule_params
      params.require(:stage_schedule).permit(:id, :band_id, :stage_id, :start, :end)
    end
end
