# encoding: UTF-8
class CrewWishesController < ApplicationController
  filter_resource_access
  layout :check_layout

  # GET /crew_wishes
  # GET /crew_wishes.xml
  def index
    @crew_wishes = CrewWish.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @crew_wishes }
    end
  end

  # GET /crew_wishes/1
  # GET /crew_wishes/1.xml
  def show
    @crew_wish = CrewWish.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @crew_wish }
    end
  end

  # GET /crew_wishes/new
  # GET /crew_wishes/new.xml
  def new
    @crew_wish = CrewWish.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @crew_wish }
    end
  end

  # GET /crew_wishes/1/edit
  def edit
    @crew_wish = CrewWish.find(params[:id])
  end

  # POST /crew_wishes
  # POST /crew_wishes.xml
  def create
    @crew_wish = CrewWish.new(params[:crew_wish])

    respond_to do |format|
      if @crew_wish.save
        format.html { redirect_to(@crew_wish, :notice => 'Crew wish was successfully created.') }
        format.xml  { render :xml => @crew_wish, :status => :created, :location => @crew_wish }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @crew_wish.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /crew_wishes/1
  # PUT /crew_wishes/1.xml
  def update
    @crew_wish = CrewWish.find(params[:id])

    respond_to do |format|
      if @crew_wish.update_attributes(params[:crew_wish])
        format.html { redirect_to(@crew_wish, :notice => 'Crew wish was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @crew_wish.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /crew_wishes/1
  # DELETE /crew_wishes/1.xml
  def destroy
    @crew_wish = CrewWish.find(params[:id])
    @crew_wish.destroy

    respond_to do |format|
      format.html { redirect_to(crew_wishes_url) }
      format.xml  { head :ok }
    end
  end
end
