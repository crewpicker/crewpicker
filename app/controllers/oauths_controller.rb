# encoding: UTF-8
class OauthsController < ApplicationController
  skip_before_filter :require_login

  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    begin
      @user = login_from(provider)
    rescue OAuth2::Error => oerr
      logger.error "OAuth2 Error: " + oerr.inspect
      logger.error oerr.backtrace
    end
    if @user
      if @user.communication_consent == nil
        redirect_to communication_consent_user_path(@user)
      else
        redirect_to root_path, :notice => "Logged in from #{provider.titleize}!"
      end
    else
      begin
        @user = create_from(provider) do |user|
          if user.username
            user
          else
            throw :missing_user_name
          end
        end
        role = Role.find_or_create_by(name: 'user')
        @user.roles << role

        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to communication_consent_user_path(@user)
      rescue
        redirect_to root_path, :alert => "Failed to login from #{provider.titleize}! (#{$!})"
      end
    end
  end
end
