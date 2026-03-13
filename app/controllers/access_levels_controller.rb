class AccessLevelsController < ApplicationController
  include ApiAuthenticatable
  before_action :attempt_api_key_authentication

  filter_resource_access
  layout :check_layout

  # GET /access_levels
  # GET /access_levels.json
  def index
    @access_levels = AccessLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @access_levels }
    end
  end

  # GET /access_levels/1
  # GET /access_levels/1.json
  def show
    @access_level = AccessLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json do
        render json: @access_level, include: { volunteers: { only: %w[name phone], methods: :group_name } }
      end
    end
  end

  # GET /access_levels/new
  # GET /access_levels/new.json
  def new
    @access_level = AccessLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @access_level }
    end
  end

  # GET /access_levels/1/edit
  def edit
    @access_level = AccessLevel.find(params[:id])
  end

  # POST /access_levels
  # POST /access_levels.json
  def create
    @access_level = AccessLevel.new(access_level_params)

    respond_to do |format|
      if @access_level.save
        format.html { redirect_to(@access_level, notice: 'Access level was successfully created.') }
        format.json { render json: @access_level, status: :created, location: @access_level }
      else
        format.html { render action: 'new' }
        format.json { render json: @access_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /access_levels/1
  # PUT /access_levels/1.json
  def update
    @access_level = AccessLevel.find(params[:id])

    respond_to do |format|
      if @access_level.update(access_level_params)
        format.html { redirect_to(@access_level, notice: 'Access level was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render action: 'edit' }
        format.json { render json: @access_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /access_levels/1
  # DELETE /access_levels/1.json
  def destroy
    @access_level = AccessLevel.find(params[:id])
    @access_level.destroy

    respond_to do |format|
      format.html { redirect_to(access_levels_url) }
      format.json { head :ok }
    end
  end

  def access_cards
    @access_level = AccessLevel.find(params[:id])
    render layout: false
  end

  private

  def access_level_params
    params.require(:access_level).permit(:id, :name, :background, :page_size, :page_orientation, :margin_top,
                                         :margin_bottom, :margin_left, :margin_right, :dpi, :zoom, :card_width, :card_height, :columns, :rows, :text_top, :text_left, :text_right, :font_size, :font_color)
  end
end
