# encoding: UTF-8
class BandsController < ApplicationController
  filter_resource_access
  layout :check_layout

  # GET /bands
  # GET /bands.xml
  def index
    @bands = Band.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bands }
    end
  end

  # GET /bands/1
  # GET /bands/1.xml
  def show
    @band = Band.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @band }
    end
  end

  # GET /bands/new
  # GET /bands/new.xml
  def new
    @band = Band.new
    @band.user_id = current_user.id
    @band.contact_name = current_user.name
    @band.email = current_user.email

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @band }
    end
  end

  # GET /bands/1/edit
  def edit
    @band = Band.find(params[:id])
  end

  # POST /bands
  # POST /bands.xml
  def create
    @band = Band.new(band_params)

    respond_to do |format|
      if @band.save
        format.html { redirect_to(@band, :notice => 'Bandet er registrert.') }
        format.xml  { render :xml => @band, :status => :created, :location => @band }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @band.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bands/1
  # PUT /bands/1.xml
  def update
    @band = Band.find(params[:id])

    respond_to do |format|
      if @band.update_attributes(band_params)
        format.html { redirect_to(@band, :notice => 'Bandopplysningene er oppdatert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @band.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bands/1
  # DELETE /bands/1.xml
  def destroy
    @band = Band.find(params[:id])
    @band.destroy

    respond_to do |format|
      format.html { redirect_to(root_url) }
      format.xml  { head :ok }
    end
  end

  filter_access_to :info
  def info
  end

  filter_access_to :mailer, :require => :mail
  def mailer
  end

  filter_access_to :mail
  def mail
    subject = params[:subject]
    content_markdown = params[:content_markdown]
    content_plain = params[:content_plain]
    if params[:send_testmail] == '1'
      recipients = current_user.email
      BandMailer::custom_email(subject, recipients, content_markdown, content_plain).deliver
      respond_to do |format|
        format.html {
          flash[:notice] = "Testmail sendt"
          render :action => "mailer"
        }
      end
    else
      recipients = Band.pluck(:email)
      BandMailer::custom_email(subject, recipients, content_markdown, content_plain).deliver
      respond_to do |format|
        format.html { redirect_to(bands_url, :notice => "Epost sendt")}
      end
    end
  end

  private

  def band_params
    params.require(:band).permit(
      :id, :name, :contact_name, :email, :phone, :address, :postal_code, :city,
      :description, :song_title, :song_composer, :song_lyrics, :playtime_wish,
      :playtime_wish_alt, :image, :user_id, band_members_attributes: [:id, :name, :phone, :role, :user_id])
  end
end
