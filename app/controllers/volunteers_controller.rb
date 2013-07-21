# encoding: UTF-8
class VolunteersController < ApplicationController
  filter_resource_access
  layout :check_layout

  def index
    @groups = Group.find(:all, :include => :volunteers, :conditions => "volunteers.id IS NOT NULL", :order => "volunteers.name")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @volunteers }
    end
  end

  # GET /volunteers/1
  # GET /volunteers/1.xml
  def show
    @volunteer = Volunteer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @volunteer }
    end
  end

  # GET /volunteers/new
  # GET /volunteers/new.xml
  def new
    @volunteer = Volunteer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @volunteer }
    end
  end

  # GET /volunteers/1/edit
  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  # POST /volunteers
  # POST /volunteers.xml
  def create
    @volunteer = Volunteer.new(volunteer_params)

    respond_to do |format|
      if @volunteer.save
        format.html { redirect_to(@volunteer, :notice => 'Volunteer was successfully created.') }
        format.xml  { render :xml => @volunteer, :status => :created, :location => @volunteer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @volunteer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /volunteers/1
  # PUT /volunteers/1.xml
  def update
    @volunteer = Volunteer.find(params[:id])

    respond_to do |format|
      if @volunteer.update_attributes(volunteer_params)
        format.html { redirect_to(volunteers_path, :notice => "#{@volunteer.name} ble oppdatert.") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @volunteer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /volunteers/1
  # DELETE /volunteers/1.xml
  def destroy
    @volunteer = Volunteer.find(params[:id])
    CrewApplication.unscoped {
      if CrewApplication.exists?(:volunteer_id => @volunteer.id)
        crew_application = CrewApplication.find_by_volunteer_id(@volunteer.id)
        crew_application.volunteer = nil
        crew_application.chosen = false
        crew_application.save
      elsif CrewApplication.exists?(:name => @volunteer.name, :email => @volunteer.email)
        crew_application = CrewApplication.find_by_name_and_email(@volunteer.name, @volunteer.email)
        crew_application.volunteer = nil
        crew_application.chosen = false
        crew_application.save
      end
    }
    @volunteer.destroy

    respond_to do |format|
      format.html { redirect_to(volunteers_url) }
      format.xml  { head :ok }
    end
  end
  def migrate_data
    Contact.all.each do |contact|
      volunteer = Volunteer.new
      volunteer.id = contact.id
      volunteer.name = contact.name
      volunteer.address = contact.address
      volunteer.birthday = contact.birthday
      volunteer.email = contact.email
      volunteer.phone = contact.phone
      volunteer.group_id = contact.group_id
      volunteer.save
    end
    redirect_to(volunteers_path)
  end
  filter_access_to :compact, :require => :index
  def compact
    @groups = Group.find(:all, :include => :volunteers, :conditions => "volunteers.id IS NOT NULL", :order => "volunteers.name")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @volunteers }
    end
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:id, :name, :address, :birthday, :email, :phone, :group_id, :access_level, :user_id)
  end
end
