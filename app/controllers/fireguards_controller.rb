# encoding: UTF-8
class FireguardsController < ApplicationController
  filter_resource_access
  layout :check_layout

  # GET /fireguards
  # GET /fireguards.xml
  def index
    @fireguards = Fireguard.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fireguards }
    end
  end

  # GET /fireguards/1
  # GET /fireguards/1.xml
  def show
    @fireguard = Fireguard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fireguard }
    end
  end

  # GET /fireguards/new
  # GET /fireguards/new.xml
  def new
    @fireguard = Fireguard.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fireguard }
    end
  end

  # GET /fireguards/1/edit
  def edit
    @fireguard = Fireguard.find(params[:id])
  end

  # POST /fireguards
  # POST /fireguards.xml
  def create
    @fireguard = Fireguard.new(params[:fireguard])

    respond_to do |format|
      if @fireguard.save
        format.html { redirect_to(@fireguard, :notice => 'Fireguard was successfully created.') }
        format.xml  { render :xml => @fireguard, :status => :created, :location => @fireguard }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fireguard.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fireguards/1
  # PUT /fireguards/1.xml
  def update
    @fireguard = Fireguard.find(params[:id])

    respond_to do |format|
      if @fireguard.update(params[:fireguard])
        format.html { redirect_to(@fireguard, :notice => 'Fireguard was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fireguard.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fireguards/1
  # DELETE /fireguards/1.xml
  def destroy
    @fireguard = Fireguard.find(params[:id])
    @fireguard.destroy

    respond_to do |format|
      format.html { redirect_to(fireguards_url) }
      format.xml  { head :ok }
    end
  end
end
