# encoding: UTF-8
class StatisticsController < ApplicationController
  filter_resource_access
  layout :check_layout

  def index
    @ad_types = AdType.all
  end

end
