# encoding: UTF-8
class AdsController < ApplicationController
  filter_access_to :all

  include ApplicationHelper

  # GET /ads
  # GET /ads.xml
  def index
    @ads = Ad.where(event_id: active_event.id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ads }
    end
  end

  # GET /ads/1
  # GET /ads/1.xml
  def show
    @ad = Ad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ad }
    end
  end

  # GET /ads/new
  # GET /ads/new.xml
  def new
    @ad = Ad.new
    @ad.salesman = current_user.name

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ad }
    end
  end

  # GET /ads/1/edit
  def edit
    @ad = Ad.find(params[:id])
  end

  # POST /ads
  # POST /ads.xml
  def create
    @ad = Ad.new(ad_params)
    if active_event
      @ad.event_id = active_event.id
    end

    respond_to do |format|
      if @ad.save
        format.html { redirect_to(:ads, :notice => 'Ad was successfully created.') }
        format.xml  { render :xml => @ad, :status => :created, :location => @ad }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ads/1
  # PUT /ads/1.xml
  def update
    @ad = Ad.find(params[:id])

    respond_to do |format|
      if @ad.update_attributes(ad_params)
        format.html { redirect_to(:ads, :notice => 'Ad was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.xml
  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy

    respond_to do |format|
      format.html { redirect_to(ads_url) }
      format.xml  { head :ok }
    end
  end

  def copy_ads_from_event
    created_ads = 0
    failed_ads = 0
    old_ads = Ad.where(event_id: params[:event_id])
    old_ads.each do |old_ad|
      new_ad = Ad.new
      new_ad.name = old_ad.name
      new_ad.contact = old_ad.contact
      new_ad.phone = old_ad.phone
      new_ad.email = old_ad.email
      new_ad.address = old_ad.address
      new_ad.ad_type_id = params[:ad_type_id]
      new_ad.parent_ad_id = old_ad.id
      new_ad.event_id = active_event.id
      if new_ad.save
        created_ads += 1
      else
        failed_ads += 1
      end
    end
    respond_to do |format|
      if failed_ads == 0
        format.html { redirect_to(:ads, notice: "Copied #{created_ads} ads from previous event.") }
        format.json { head :ok }
      else
        format.html { redirect_to(:ads, notice: "#{failed_ads} was not copied because of errors. #{created_ads} were successfully copied.") }
        format.json { render json: { errors: "#{failed_ads} was not copied because of errors. #{created_ads} were successfully copied."} }
      end
    end
  end

  private

  def ad_params
    params.require(:ad).permit(:id, :name, :contact, :phone, :email, :ad_type_id, :address, :notes, :salesman, :event_id, :parent_ad_id)
  end
end
