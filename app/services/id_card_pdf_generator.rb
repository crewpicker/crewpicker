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

    items.each_slice(cards_per_page).with_index do |page_items, page_index|
      @document.start_new_page if page_index > 0

      # Draw background image if available
      draw_background_image

      # Calculate card dimensions accounting for margins and gutters
      page_width = @document.bounds.width
      page_height = @document.bounds.height

      # Account for page margins (15px) and inter-card margins (5px)
      page_margin_px = 15
      card_gutter_h_px = 10  # horizontal gutter between columns
      card_gutter_v_px = 10  # vertical gutter between rows

      # Convert to PDF points
      page_margin_left = page_margin_px * 0.75
      page_margin_right = page_margin_px * 0.75
      page_margin_top = page_margin_px * 0.75
      page_margin_bottom = page_margin_px * 0.75
      card_gutter_h = card_gutter_h_px * 0.75
      card_gutter_v = card_gutter_v_px * 0.75

      # Calculate available space for cards (excluding margins)
      available_width = page_width - page_margin_left - page_margin_right
      available_height = page_height - page_margin_top - page_margin_bottom

      # Calculate card dimensions (excluding gutters)
      total_horizontal_gutter = card_gutter_h * (@config[:columns] - 1)
      total_vertical_gutter = card_gutter_v * (@config[:rows] - 1)

      card_width = (available_width - total_horizontal_gutter) / @config[:columns]
      card_height = (available_height - total_vertical_gutter) / @config[:rows]

      page_items.each_with_index do |item, index|
        row = index / @config[:columns]
        col = index % @config[:columns]

        # Account for page margins (15px) and inter-card margins (5px)
        # Convert margins to PDF points: 1px = 0.75 points
        page_margin_top = 15 * 0.75
        page_margin_left = 15 * 0.75
        card_gutter_h = 5 * 0.75  # horizontal gutter between columns
        card_gutter_v = 5 * 0.75  # vertical gutter between rows

        # Calculate x position with margins
        # Left column starts at: page_margin_left
        # Each subsequent column adds: card_width + card_gutter_h
        x = page_margin_left + (col * (card_width + card_gutter_h))

        # Calculate y position with margins
        # Top row starts at: page_height - page_margin_top - card_height
        # Each subsequent row adds: card_height + card_gutter_v
        y = page_height - page_margin_top - ((row + 1) * card_height) - (row * card_gutter_v)

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

    begin
      uri = URI.parse(background_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == 'https')
      http.read_timeout = 10

      # Disable SSL verification for development/testing
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE if http.use_ssl?

      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)

      if response.code == '200'
        @background_image_data = response.body
        @background_image_type = File.extname(@access_level.background).downcase.delete('.')
      end
    rescue StandardError => e
      Rails.logger.warn "Failed to load background image from #{background_url}: #{e.message}"
    end
  end

  def draw_background_image
    return unless @background_image_data && @background_image_type

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

    font_color = @config[:font_color].to_s.gsub('#', '')
    font_color = '000000' if font_color.empty?

    @document.fill_color(font_color)

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

    font_color = @config[:font_color].to_s.gsub('#', '')
    font_color = '000000' if font_color.empty?

    @document.fill_color(font_color)

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
    name_y = y - title_height - 2

    @document.text_box(person.short_name, at: [x, name_y], width: width, align: :center)
  end
end
