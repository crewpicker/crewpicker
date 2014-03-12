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
    if @user = login_from(provider)
      redirect_to root_path, :notice => "Logged in from #{provider.titleize}!"
    else
      begin
        # FIXME passing block here is dirty filthy terrible hack to allow facebook login without email.
        @user = create_from(provider) do |user|
          if !user.username
            user.username = DateTime.now.to_i
          end
          user
        end
        role = Role.find_or_create_by_name('user')
        @user.roles << role

        # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule

        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to root_path, :notice => "Logged in from #{provider.titleize}!"
      rescue
        redirect_to root_path, :alert => "Failed to login from #{provider.titleize}!"
      end
    end
  end
end
