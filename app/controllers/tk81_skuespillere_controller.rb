class Tk81SkuespillereController < ApplicationController
  before_action :set_tk81_skuespiller, only: %i[show edit update destroy]
  filter_resource_access
  layout :check_layout

  include ApplicationHelper

  # GET /tk81_skuespillere or /tk81_skuespillere.json
  def index
    @tk81_skuespillere = Tk81Skuespiller.includes(:tk81_pamelding).where(tk81_pameldinger: { event_id: active_event.id })
  end

  # GET /tk81_skuespillere/1 or /tk81_skuespillere/1.json
  def show; end

  # GET /tk81_skuespillere/new
  def new
    @tk81_skuespiller = Tk81Skuespiller.new
    @tk81_skuespiller.build_tk81_pamelding
    @tk81_skuespiller.tk81_pamelding.user_id = current_user.id if current_user
    @tk81_skuespiller.tk81_pamelding.event_id = active_event.id
  end

  # GET /tk81_skuespillere/1/edit
  def edit; end

  # POST /tk81_skuespillere or /tk81_skuespillere.json
  def create
    @tk81_skuespiller = Tk81Skuespiller.new(tk81_skuespiller_params)

    respond_to do |format|
      if @tk81_skuespiller.save
        format.html { redirect_to :root, notice: 'Påmeldingen var vellykket' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tk81_skuespillere/1 or /tk81_skuespillere/1.json
  def update
    respond_to do |format|
      if @tk81_skuespiller.update(tk81_skuespiller_params)
        format.html { redirect_to tk81_skuespiller_url(@tk81_skuespiller), notice: 'Påmeldingen ble oppdatert' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tk81_skuespillere/1 or /tk81_skuespillere/1.json
  def destroy
    @tk81_skuespiller.destroy

    respond_to do |format|
      format.html { redirect_to tk81_skuespillere_url, notice: 'Tk81 skuespiller was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tk81_skuespiller
    @tk81_skuespiller = Tk81Skuespiller.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tk81_skuespiller_params
    params.require(:tk81_skuespiller).permit(:klesstorrelse, :skostorrelse, :vil_danse, :samme_rolle, :samtykke,
                                             tk81_pamelding_attributes: %i[id navn fodselsdato skole telefon
                                                                           navn_foresatte epost_foresatte
                                                                           telefon_foresatte foresatte_bidrag_id
                                                                           event_id user_id])
  end
end
