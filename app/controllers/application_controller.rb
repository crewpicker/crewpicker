# encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter do |c|
    Authorization.current_user = c.current_user
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  before_filter :set_locale

  def set_locale
    I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
  end

  def permission_denied
    if !current_user
      redirect_to login_url
    else
      redirect_to root_url, :notice => "Du har ikke tilgang til denne siden."
    end
  end

  def check_layout
    'application'
  end
end
