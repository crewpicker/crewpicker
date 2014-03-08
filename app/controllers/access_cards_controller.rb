# encoding: UTF-8
class AccessCardsController < ApplicationController
  filter_access_to :all

  def show
    @access_level = AccessLevel.find(params[:id])
    if @access_level.name == "Band"
      @people = BandMember.all
    end
    render :layout => false
  end

  filter_access_to :blank, :require => :show
  def blank
    @access_level = AccessLevel.find(params[:id])
    render :layout => false
  end

end
