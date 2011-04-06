class AccessCardsController < ApplicationController
  def show
    @access_level = AccessLevel.find(params[:id])
    render :layout => false
  end

  def blank
    @access_level = AccessLevel.find(params[:id])
    render :layout => false
  end

end
