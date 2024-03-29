# encoding: UTF-8
class CrewApplicationsController < ApplicationController
  filter_resource_access
  layout :check_layout

  # GET /crew_applications
  # GET /crew_applications.xml
  def index
    @crew_applications = CrewApplication.all

    respond_to do |format|
      format.html { render }
      format.xml  { render :xml => @crew_applications }
    end
  end

  # GET /crew_applications/1
  # GET /crew_applications/1.xml
  def show
    @crew_application = CrewApplication.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @crew_application }
    end
  end

  # GET /crew_applications/new
  # GET /crew_applications/new.xml
  def new
    @crew_application = CrewApplication.new
    4.times do
      crew_wish = @crew_application.crew_wishes.build
    end

    respond_to do |format|
      format.html
      format.xml  { render :xml => @crew_application }
    end
  end

  # GET /crew_applications/1/edit
  def edit
    @crew_application = CrewApplication.find(params[:id])
  end

  # POST /crew_applications
  # POST /crew_applications.xml
  def create
    @crew_application = CrewApplication.new(crew_application_params)

    respond_to do |format|
      if @crew_application.save
        format.html { redirect_to(@crew_application, :notice => 'Crew application was successfully created.') }
        format.xml  { render :xml => @crew_application, :status => :created, :location => @crew_application }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @crew_application.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /crew_applications/1
  # PUT /crew_applications/1.xml
  def update
    @crew_application = CrewApplication.find(params[:id])

    respond_to do |format|
      if @crew_application.update(crew_application_params)
        format.html { redirect_to(@crew_application, :notice => 'Crew application was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @crew_application.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /crew_applications/1
  # DELETE /crew_applications/1.xml
  def destroy
    @crew_application = CrewApplication.find(params[:id])
    @crew_application.destroy

    respond_to do |format|
      format.html {
        if permitted_to? :index, :crew_applications
          redirect_to(crew_applications_url)
        else
          redirect_to :root
        end
      }
      format.xml  { head :ok }
    end
  end
  def choose
    crew_application = CrewApplication.find(params[:id])
    @volunteer = Volunteer.new
    @volunteer.name = crew_application.name
    @volunteer.address = crew_application.address
    @volunteer.birthday = crew_application.birthday
    @volunteer.email = crew_application.email
    @volunteer.phone = crew_application.phone
    @volunteer.group_id = params[:group_id]
    @volunteer.user_id = crew_application.user_id
    @volunteer.access_level = 'Crew'

    respond_to do |format|
      if @volunteer.save
        crew_application.chosen = true
        crew_application.volunteer = @volunteer
        crew_application.save
        format.html { redirect_to(@volunteer.group, :notice => 'Volunteer was successfully created.') }
        format.xml  { render :xml => @volunteer, :status => :created, :location => @volunteer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @volunteer.errors, :status => :unprocessable_entity }
      end
    end
  end
  filter_access_to :hidden, :require => :index
  def hidden
    CrewApplication.unscoped {
      @crew_applications = CrewApplication.hidden
    }
    render 'index'
  end
  filter_access_to :unhide, :require => :update
  def unhide
    CrewApplication.unscoped {
      @crew_application = CrewApplication.find(params[:id])
      @crew_application.chosen = nil
      @crew_application.volunteer_id = nil
      @crew_application.save
    }

    respond_to do |format|
      format.html {
        redirect_to :crew_applications_hidden
      }
      format.xml {
        head :ok
      }
    end
  end

  private

  def crew_application_params
    params.require(:crew_application).permit(:id, :name, :address, :birthday, :email, :phone, :experience, :user_id, crew_wishes_attributes: [:id, :group_id, :priority])
  end
end
