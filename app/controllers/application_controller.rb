class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter { |c| Authorization.current_user = c.current_user }

  def permission_denied
    if !current_user
      redirect_to login_url
    else
      redirect_to root_url, :notice => "Du har ikke tilgang til denne siden."
    end
  end
end
