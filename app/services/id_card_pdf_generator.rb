# ID Card PDF Generator using Prawn
class IdCardPdfGenerator
  attr_reader :document

  def initialize(access_level, bands = nil)
    @access_level = access_level
    @bands = bands
    @config = access_level.card_config
  end

  def generate_with_people
    # Collect people based on access level type
    people = []
    if @access_level.name == 'Band'
      @bands.each do |band|
        band.band_members.each do |band_member|
          people << band_member
        end
      end
    else
      people = @access_level.volunteers
    end

    generate_cards(people)
  end

  def generate_blank_cards
    cards_per_page = @config[:columns] * @config[:rows]
    cards = Array.new(cards_per_page) { |i| i }
    generate_cards(cards, blank: true)
  end

  private

  def generate_cards(items, blank: false)
    setup_document

    cards_per_page = @config[:columns] * @config[:rows]

    items.each_slice(cards_per_page) do |page_items|
      @document.start_new_page unless @document.page_number == 1

      # Draw background image if available
      draw_background_image

      # Calculate card dimensions
      page_width = @document.bounds.width
      page_height = @document.bounds.height
      card_width = page_width / @config[:columns]
      card_height = page_height / @config[:rows]

      page_items.each_with_index do |item, index|
        row = index / @config[:columns]
        col = index % @config[:columns]

        x = col * card_width
        y = page_height - ((row + 1) * card_height) # PDF coordinates start from bottom

        draw_card(x, y, card_width, card_height, item, blank)
      end
    end

    @document.render
  end

  def setup_document
    @document = Prawn::Document.new(
      page_size: @config[:page_size].upcase,
      margin: [@config[:margin_top], @config[:margin_right], @config[:margin_bottom], @config[:margin_left]]
    )

    # Register Impact font
    font_path = Rails.root.join('app', 'assets', 'stylesheets', 'impact.ttf')
    if File.exist?(font_path)
      @document.font_families.update('Impact' => {
                                       normal: font_path.to_s
                                     })
    end

    # Load background image if available
    load_background_image if @access_level.background.present?

    @document
  end

  def load_background_image
    # Get instance from ENV or default to 'rmr' for backward compatibility
    instance = ENV['CREWPICKER_INSTANCE'].presence || 'rmr'
    background_url = "https://files.crewpicker.io/#{instance}/#{@access_level.background}"

    Rails.logger.info "Loading background image from: #{background_url}"

    begin
      uri = URI.parse(background_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == 'https')
      http.read_timeout = 10 # 10 second timeout

      # Disable SSL verification for development/testing
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE if http.use_ssl?

      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)

      if response.code == '200'
        @background_image_data = response.body
        @background_image_type = File.extname(@access_level.background).downcase.delete('.')
        Rails.logger.info "Successfully loaded background image: #{@background_image_data.length} bytes"
      else
        Rails.logger.warn "Failed to load background image: HTTP #{response.code}"
      end
    rescue StandardError => e
      Rails.logger.warn "Failed to load background image from #{background_url}: #{e.message}"
      Rails.logger.warn "Error backtrace: #{e.backtrace.first(5).join(', ')}"
    end
  end

  def draw_background_image
    return unless @background_image_data && @background_image_type

    Rails.logger.info "Drawing background image on page #{@document.page_number}"

    begin
      # Create a temp file with the image data
      temp_file = Tempfile.new(['background', ".#{@background_image_type}"])
      temp_file.binmode
      temp_file.write(@background_image_data)
      temp_file.close

      # Embed image in PDF - fill the entire page
      @document.image(temp_file.path,
                      at: [0, @document.bounds.height],
                      width: @document.bounds.width,
                      height: @document.bounds.height)

      Rails.logger.info 'Background image drawn successfully'
    rescue StandardError => e
      Rails.logger.error "Failed to draw background image: #{e.message}"
    ensure
      temp_file&.unlink
    end
  end

  def draw_card(x, y, width, height, item, blank)
    # Calculate text position
    text_top = @access_level.calculated_text_top
    text_left = @config[:text_left]
    text_right = @config[:text_right]

    # Convert pixel positions to PDF points (1 pixel = 0.75 points at 96 DPI)
    pdf_text_top = text_top * 0.75
    pdf_text_left = text_left * 0.75
    pdf_text_right = text_right * 0.75

    # Text positioning within card
    # y is bottom of card, so y + height is top of card
    # text_y is measured from bottom of page
    text_x = x + pdf_text_left
    text_y = y + height - pdf_text_top

    if blank
      draw_blank_card_text(text_x, text_y, width - pdf_text_left - pdf_text_right)
    else
      draw_person_card_text(text_x, text_y, width - pdf_text_left - pdf_text_right, item)
    end
  end

  def draw_blank_card_text(x, y, width)
    @document.font('Impact')
    @document.font_size(@config[:font_size] * 0.75)
    @document.fill_color(@config[:font_color].gsub('#', ''))

    if @access_level.name == 'Band'
      @document.text_box('BAND', at: [x, y], width: width, align: :center)
    elsif @access_level.name == 'Lydteamet'
      # Empty for Lydteamet
    else
      @document.text_box(@access_level.name.upcase, at: [x, y], width: width, align: :center)
    end
  end

  def draw_person_card_text(x, y, width, person)
    @document.font('Impact')
    @document.fill_color(@config[:font_color].gsub('#', ''))

    # Determine card title
    card_title = if @access_level.name == 'Band'
                   @access_level.name.upcase
                 elsif @access_level.name.upcase == person.group.name.upcase
                   @access_level.name.upcase
                 else
                   "#{@access_level.name.upcase}\n#{person.group.name}"
                 end

    # Draw title with main font size
    title_font_size = @config[:font_size] * 0.75
    @document.font_size(title_font_size)

    # Calculate title height (approximate: line height * number of lines)
    line_count = card_title.count("\n") + 1
    title_height = title_font_size * line_count

    # Draw title
    @document.text_box(card_title, at: [x, y], width: width, align: :center)

    # Draw name below with smaller font
    name_font_size = (@config[:font_size] * 0.833).to_i * 0.75
    @document.font_size(name_font_size)

    # Position name below title with some spacing
    name_y = y - title_height - (name_font_size * 0.5)

    @document.text_box(person.short_name, at: [x, name_y], width: width, align: :center)
  end
end
