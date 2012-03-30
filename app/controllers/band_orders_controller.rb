class BandOrdersController < ApplicationController
  # GET /band_orders
  # GET /band_orders.xml
  def index
    @band_orders = StageSchedule.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @band_orders }
    end
  end

  # GET /band_orders/1
  # GET /band_orders/1.xml
  def show
    @band_order = StageSchedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @band_order }
    end
  end

  # GET /band_orders/new
  # GET /band_orders/new.xml
  def new
    @band_order = StageSchedule.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @band_order }
    end
  end

  # GET /band_orders/1/edit
  def edit
    @band_order = StageSchedule.find(params[:id])
  end

  # POST /band_orders
  # POST /band_orders.xml
  def create
    @band_order = StageSchedule.new(params[:stage_schedule])

    respond_to do |format|
      if @band_order.save
        format.html { redirect_to(band_orders_url, :notice => 'Band order was successfully created.') }
        format.xml  { render :xml => @band_order, :status => :created, :location => @band_order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @band_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /band_orders/1
  # PUT /band_orders/1.xml
  def update
    @band_order = StageSchedule.find(params[:id])

    respond_to do |format|
      if @band_order.update_attributes(params[:stage_schedule])
        format.html { redirect_to(band_orders_url, :notice => 'Band order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @band_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /band_orders/1
  # DELETE /band_orders/1.xml
  def destroy
    @band_order = StageSchedule.find(params[:id])
    @band_order.destroy

    respond_to do |format|
      format.html { redirect_to(band_orders_url) }
      format.xml  { head :ok }
    end
  end
end
