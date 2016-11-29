# encoding: UTF-8
class HomeController < ApplicationController
  filter_access_to :all

  def index
    if !ActiveEvent.first
      redirect_to :setup_wizard
    end
  end

  def setup
  end

end
