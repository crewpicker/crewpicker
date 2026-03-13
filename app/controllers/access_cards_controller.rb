class AccessCardsController < ApplicationController
  filter_access_to :all

  def show
    @access_level = AccessLevel.find(params[:id])
    @bands = Band.all if @access_level.name == 'Band'

    # Handle PDF format
    if request.format.pdf?
      generator = IdCardPdfGenerator.new(@access_level, @bands)
      pdf_data = generator.generate_with_people

      send_data pdf_data, type: 'application/pdf', disposition: 'inline',
                          filename: "#{@access_level.name}_cards.pdf"
    else
      # Render HTML view for preview
      render layout: false
    end
  end

  filter_access_to :blank, require: :show
  def blank
    @access_level = AccessLevel.find(params[:id])

    # Handle PDF format
    if request.format.pdf?
      generator = IdCardPdfGenerator.new(@access_level)
      pdf_data = generator.generate_blank_cards

      send_data pdf_data, type: 'application/pdf', disposition: 'inline',
                          filename: "#{@access_level.name}_blank_cards.pdf"
    else
      # Render HTML view for preview
      render layout: false
    end
  end
end
