# encoding: UTF-8
class AccessLevelsController < ApplicationController
  filter_resource_access
  layout :check_layout

  # GET /access_levels
  # GET /access_levels.xml
  def index
    @access_levels = AccessLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @access_levels }
    end
  end

  # GET /access_levels/1
  # GET /access_levels/1.xml
  def show
    @access_level = AccessLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @access_level }
    end
  end

  # GET /access_levels/new
  # GET /access_levels/new.xml
  def new
    @access_level = AccessLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @access_level }
    end
  end

  # GET /access_levels/1/edit
  def edit
    @access_level = AccessLevel.find(params[:id])
  end

  # POST /access_levels
  # POST /access_levels.xml
  def create
    @access_level = AccessLevel.new(access_level_params)

    respond_to do |format|
      if @access_level.save
        format.html { redirect_to(@access_level, :notice => 'Access level was successfully created.') }
        format.xml  { render :xml => @access_level, :status => :created, :location => @access_level }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @access_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /access_levels/1
  # PUT /access_levels/1.xml
  def update
    @access_level = AccessLevel.find(params[:id])

    respond_to do |format|
      if @access_level.update_attributes(access_level_params)
        format.html { redirect_to(@access_level, :notice => 'Access level was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @access_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /access_levels/1
  # DELETE /access_levels/1.xml
  def destroy
    @access_level = AccessLevel.find(params[:id])
    @access_level.destroy

    respond_to do |format|
      format.html { redirect_to(access_levels_url) }
      format.xml  { head :ok }
    end
  end

  def access_cards
    @access_level = AccessLevel.find(params[:id])
    render :layout => false
  end

  private

  def access_level_params
    params.require(:access_level).permit(:id, :name, :background)
  end
end
