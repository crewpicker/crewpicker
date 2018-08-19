# encoding: UTF-8
class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    respond_to do |format|
      if @user = login(params[:username],params[:password])
        if @user.communication_consent == nil
          format.html { redirect_to communication_consent_user_path(@user) }
        else
          format.html { redirect_to :root }
        end
      else
        format.html { redirect_to(:login, :alert => "Feil brukernavn/passord!" ) }
      end
    end
  end

  def destroy
    logout
    redirect_to(:root, :notice => 'Du er nå logget ut.')
  end
end
