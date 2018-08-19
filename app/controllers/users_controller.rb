# encoding: UTF-8
class UsersController < ApplicationController
  filter_access_to :all
  filter_access_to :communication_consent, :require => :edit
  layout :check_layout

  # GET /users
  # GET /users.xml
  def index
    @users = User.includes(:volunteers, :bands, :crew_application, :roles, :authentications)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    @user.communication_consent = true

    respond_to do |format|
      format.html
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(user_params)
    role = Role.find_or_create_by(name: 'user')
    @user.roles << role
    if @user.username == nil
      @user.username = @user.email
    end

    respond_to do |format|
      if @user.save
        if @user.id == 1
          @user.roles.find_or_create_by(name: 'admin')
        end
        format.html { redirect_to(:root, :notice => 'Registreringen var vellykket. Du kan nå logge inn.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(user_params)
        if params[:to_home_page]
          format.html { redirect_to(:root, :notice => 'User was successfully updated.') }
        else
          format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
          format.xml  { head :ok }
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  def communication_consent
    @user = User.find(params[:id])
    @user.communication_consent = true
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :communication_consent, :role_ids => [])
  end
end
