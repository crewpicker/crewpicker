# encoding: UTF-8
class UserSessionsController < ApplicationController
  layout :check_layout
  def new
    @user = User.new
    render :layout => 'public'
  end

  def create
    respond_to do |format|
      if @user = login(params[:username],params[:password])
        format.html { redirect_to :root }
        format.xml { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { redirect_to(:login, :alert => "Feil brukernavn/passord!" ) }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    logout
    redirect_to(:root, :notice => 'Logged out!')
  end
end
