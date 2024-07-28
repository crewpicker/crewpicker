class Tk81TeknikereController < ApplicationController
  before_action :set_tk81_tekniker, only: %i[show edit update destroy]
  filter_resource_access
  layout :check_layout

  include ApplicationHelper

  # GET /tk81_teknikere or /tk81_teknikere.json
  def index
    @tk81_teknikere = Tk81Tekniker.includes(:tk81_pamelding).where(tk81_pameldinger: { event_id: active_event.id })
  end

  # GET /tk81_teknikere/1 or /tk81_teknikere/1.json
  def show; end

  # GET /tk81_teknikere/new
  def new
    @tk81_tekniker = Tk81Tekniker.new
    @tk81_tekniker.build_tk81_pamelding
    @tk81_tekniker.tk81_pamelding.user_id = current_user.id if current_user
    @tk81_tekniker.tk81_pamelding.event_id = active_event.id
  end

  # GET /tk81_teknikere/1/edit
  def edit; end

  # POST /tk81_teknikere or /tk81_teknikere.json
  def create
    @tk81_tekniker = Tk81Tekniker.new(tk81_tekniker_params)

    respond_to do |format|
      if @tk81_tekniker.save
        format.html { redirect_to :root, notice: 'Påmeldingen var vellykket' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tk81_teknikere/1 or /tk81_teknikere/1.json
  def update
    respond_to do |format|
      if @tk81_tekniker.update(tk81_tekniker_params)
        format.html { redirect_to tk81_tekniker_url(@tk81_tekniker), notice: 'Påmeldingen ble oppdatert' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tk81_teknikere/1 or /tk81_teknikere/1.json
  def destroy
    @tk81_tekniker.destroy

    respond_to do |format|
      format.html { redirect_to tk81_teknikere_url, notice: 'Tk81 tekniker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tk81_tekniker
    @tk81_tekniker = Tk81Tekniker.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tk81_tekniker_params
    params.require(:tk81_tekniker).permit('1valg_id', '2valg_id', '3valg_id', :valgt_id,
                                          tk81_pamelding_attributes: %i[id navn fodselsdato skole telefon
                                                                        navn_foresatte epost_foresatte
                                                                        telefon_foresatte foresatte_bidrag_id
                                                                        event_id user_id])
  end
end
