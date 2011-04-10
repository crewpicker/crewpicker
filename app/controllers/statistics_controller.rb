class StatisticsController < ApplicationController
  def index
    @ad_types = AdType.all
  end

end
