class CrewApplicationsController < ApplicationController
  # GET /crew_applications
  # GET /crew_applications.xml
  filter_resource_access
  def index
    @crew_applications = CrewApplication.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @crew_applications }
    end
  end

  # GET /crew_applications/1
  # GET /crew_applications/1.xml
  def show
    @crew_application = CrewApplication.find(params[:id])

    respond_to do |format|
      format.html { render :layout => 'public' }
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
      format.html { render :layout => 'public' }
      format.xml  { render :xml => @crew_application }
    end
  end

  # GET /crew_applications/1/edit
  def edit
    @crew_application = CrewApplication.find(params[:id])
    render :layout => 'public'
  end

  # POST /crew_applications
  # POST /crew_applications.xml
  def create
    @crew_application = CrewApplication.new(params[:crew_application])

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
      if @crew_application.update_attributes(params[:crew_application])
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
          redirect_to :root_path
        end
      }
      format.xml  { head :ok }
    end
  end
end
