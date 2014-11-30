# encoding: UTF-8
class BandMembersController < ApplicationController
  filter_resource_access
  layout :check_layout

  # GET /band_members
  # GET /band_members.xml
  def index
    @bands = Band.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @band_members }
    end
  end

  # GET /band_members/1
  # GET /band_members/1.xml
  def show
    @band_member = BandMember.find(params[:id])
    @band = Band.find(params[:band_id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @band_member }
    end
  end

  # GET /band_members/new
  # GET /band_members/new.xml
  def new
    @band_member = BandMember.new
    @band = Band.find(params[:band_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @band_member }
    end
  end

  # GET /band_members/1/edit
  def edit
    @band_member = BandMember.find(params[:id])
    @band = Band.find(params[:band_id])
  end

  # POST /band_members
  # POST /band_members.xml
  def create
    @band_member = BandMember.new(band_member_params)
    @band = Band.find(params[:band_id])
    @band.band_members << @band_member

    respond_to do |format|
      if @band_member.save
        format.html { redirect_to(@band, :notice => 'Band member was successfully created.') }
        format.xml  { render :xml => @band_member, :status => :created, :location => @band_member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @band_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /band_members/1
  # PUT /band_members/1.xml
  def update
    @band_member = BandMember.find(params[:id])

    respond_to do |format|
      if @band_member.update_attributes(band_member_params)
        format.html { redirect_to(@band_member.band, :notice => 'Band member was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @band_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /band_members/1
  # DELETE /band_members/1.xml
  def destroy
    @band_member = BandMember.find(params[:id])
    band = @band_member.band
    @band_member.destroy

    respond_to do |format|
      format.html { redirect_to(band) }
      format.xml  { head :ok }
    end
  end

  private

  def band_member_params
    params.require(:band_member).permit(:id, :name, :phone, :role, :user_id)
  end
end
