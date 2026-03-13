class AccessLevel < ApplicationRecord
  has_many :volunteers, primary_key: 'name', foreign_key: 'access_level'
  default_scope -> { order :name }

  # Card configuration defaults
  def card_config
    {
      page_size: page_size.presence || 'A4',
      page_orientation: page_orientation.presence || 'portrait',
      margin_top: margin_top || 0,
      margin_bottom: margin_bottom || 0,
      margin_left: margin_left || 0,
      margin_right: margin_right || 0,
      dpi: dpi || 96,
      zoom: zoom || 1.0,
      card_width: card_width,
      card_height: card_height,
      columns: columns || 3,
      rows: rows || 2,
      text_top: text_top,
      text_left: text_left || 28,
      text_right: text_right || 28,
      font_size: font_size || 24,
      font_color: font_color || '#000000'
    }
  end

  # Calculate pixel dimensions based on page size and orientation
  def page_dimensions
    case page_size.presence || 'A4'
    when 'A4'
      if (page_orientation.presence || 'portrait') == 'portrait'
        { width: 794, height: 1123 } # A4 portrait in pixels at 96 DPI
      else
        { width: 1123, height: 794 } # A4 landscape in pixels at 96 DPI
      end
    when 'Letter'
      if (page_orientation.presence || 'portrait') == 'portrait'
        { width: 816, height: 1056 } # Letter portrait in pixels at 96 DPI
      else
        { width: 1056, height: 816 } # Letter landscape in pixels at 96 DPI
      end
    else
      { width: 794, height: 1123 } # Default to A4 portrait
    end
  end

  # Calculate card dimensions if not explicitly set
  def calculated_card_dimensions
    dims = page_dimensions
    cols = columns || 3
    rows_per_page = rows || 2

    {
      width: card_width || (dims[:width] / cols).to_i,
      height: card_height || (dims[:height] / rows_per_page).to_i
    }
  end

  def calculated_text_top
    return text_top if text_top.present?

    card_dims = calculated_card_dimensions
    # Default to ~54% from top (matching original 302px / 558px ≈ 0.54)
    (card_dims[:height] * 0.54).to_i
  end
end
