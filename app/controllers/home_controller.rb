# encoding: UTF-8
class HomeController < ApplicationController
  filter_access_to :all

  def index
    if !ActiveEvent.first
      redirect_to :setup_wizard
    elsif ENV['CREWPICKER_INSTANCE']
      if lookup_context.find_all('home/' + ENV['CREWPICKER_INSTANCE']).any?
        render ENV['CREWPICKER_INSTANCE']
      end
    end
  end

  def setup; end
end
