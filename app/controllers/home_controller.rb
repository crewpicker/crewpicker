class HomeController < ApplicationController
  filter_resource_access
  layout :check_layout

  def index
  end

end
