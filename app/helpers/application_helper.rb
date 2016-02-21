module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end
  def nl2br(s)
    if !s.nil?
      s.gsub(/\n/, "<br>").html_safe
    end
  end
  def pdf_image_path(image)
    return File.expand_path(Rails.root) + '/public/images/' + image
  end
  def age_at(date, dob)
   day_diff = date.day - dob.day
   month_diff = date.month - dob.month - (day_diff < 0 ? 1 : 0)
   date.year - dob.year - (month_diff < 0 ? 1 : 0)
  end
  def active_event
    ActiveEvent.first.event
  end
  def festival_title
    if active_event
      return active_event.name
    else
      return "FestivalAdmin"
    end
  end
end
