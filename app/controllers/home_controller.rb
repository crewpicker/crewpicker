class HomeController < ApplicationController
  filter_resource_access
  def index
    render :layout => 'public'
  end

end
