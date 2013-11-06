# encoding: UTF-8
class HomeController < ApplicationController
  filter_resource_access
  layout :check_layout

  def index
    event = Event.first
    if event
      @title = Event.first.name
    else
      @title = 'FestivalAdmin'
    end
  end

end
