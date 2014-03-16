class CrewMerchandiseOrdersController < ApplicationController
  before_action :set_crew_merchandise_order, only: [:show, :edit, :update, :destroy]

  # GET /crew_merchandise_orders
  def index
    @crew_merchandise_orders = CrewMerchandiseOrder.all
  end

  # GET /crew_merchandise_orders/1
  def show
  end

  # GET /crew_merchandise_orders/new
  def new
    @crew_merchandise_order = CrewMerchandiseOrder.new
  end

  # GET /crew_merchandise_orders/1/edit
  def edit
  end

  # POST /crew_merchandise_orders
  def create
    @crew_merchandise_order = CrewMerchandiseOrder.new(crew_merchandise_order_params)

    if @crew_merchandise_order.save
      redirect_to @crew_merchandise_order, notice: 'Crew merchandise order was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /crew_merchandise_orders/1
  def update
    if @crew_merchandise_order.update(crew_merchandise_order_params)
      redirect_to @crew_merchandise_order, notice: 'Crew merchandise order was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /crew_merchandise_orders/1
  def destroy
    @crew_merchandise_order.destroy
    redirect_to crew_merchandise_orders_url, notice: 'Crew merchandise order was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crew_merchandise_order
      @crew_merchandise_order = CrewMerchandiseOrder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def crew_merchandise_order_params
      params.require(:crew_merchandise_order).permit(:volunteer_id)
    end
end
