class StatisticsController < ApplicationController
  def index
    volunteers = Volunteer.all
  end

end
