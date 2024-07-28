module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def nl2br(s)
    s&.gsub(/\n/, '<br>')&.html_safe
  end

  def pdf_image_path(image)
    "#{File.expand_path(Rails.root)}/public/images/#{image}"
  end

  def age_at(date, dob)
    day_diff = date.day - dob.day
    month_diff = date.month - dob.month - (day_diff.negative? ? 1 : 0)
    date.year - dob.year - (month_diff.negative? ? 1 : 0)
  end

  def active_event
    if params[:event_id]
      Event.find(params[:event_id])
    elsif ActiveEvent.first
      ActiveEvent.first.event
    end
  end

  def festival_title
    active_event ? active_event.name : 'Crewpicker'
  end
end
