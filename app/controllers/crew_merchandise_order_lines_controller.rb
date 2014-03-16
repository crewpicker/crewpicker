class CrewMerchandiseOrderLinesController < ApplicationController
  before_action :set_crew_merchandise_order_line, only: [:show, :edit, :update, :destroy]

  # GET /crew_merchandise_order_lines
  def index
    @crew_merchandise_order_lines = CrewMerchandiseOrderLine.all
  end

  # GET /crew_merchandise_order_lines/1
  def show
  end

  # GET /crew_merchandise_order_lines/new
  def new
    @crew_merchandise_order_line = CrewMerchandiseOrderLine.new
  end

  # GET /crew_merchandise_order_lines/1/edit
  def edit
  end

  # POST /crew_merchandise_order_lines
  def create
    @crew_merchandise_order_line = CrewMerchandiseOrderLine.new(crew_merchandise_order_line_params)

    if @crew_merchandise_order_line.save
      redirect_to @crew_merchandise_order_line, notice: 'Crew merchandise order line was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /crew_merchandise_order_lines/1
  def update
    if @crew_merchandise_order_line.update(crew_merchandise_order_line_params)
      redirect_to @crew_merchandise_order_line, notice: 'Crew merchandise order line was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /crew_merchandise_order_lines/1
  def destroy
    @crew_merchandise_order_line.destroy
    redirect_to crew_merchandise_order_lines_url, notice: 'Crew merchandise order line was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crew_merchandise_order_line
      @crew_merchandise_order_line = CrewMerchandiseOrderLine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def crew_merchandise_order_line_params
      params.require(:crew_merchandise_order_line).permit(:crew_merchandise_order_id, :quantity, :merchandise_article_variant_id)
    end
end
