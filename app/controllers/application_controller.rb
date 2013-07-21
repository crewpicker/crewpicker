# encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter do |c|
    Authorization.current_user = c.current_user
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  def permission_denied
    if !current_user
      redirect_to login_url
    else
      redirect_to root_url, :notice => "Du har ikke tilgang til denne siden."
    end
  end

  def check_layout
    if !current_user.nil? and current_user.roles.find_by_name('admin')
      return 'application'
    else
      return 'public'
    end
  end
end
