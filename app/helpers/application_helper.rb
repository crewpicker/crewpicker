module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end
  def nl2br(s)
    s.gsub(/\n/, "<br>").html_safe
  end
  def pdf_image_path(image)
    return File.expand_path(Rails.root) + '/public/images/' + image
  end
  def age_at(date, dob)
   day_diff = date.day - dob.day
   month_diff = date.month - dob.month - (day_diff < 0 ? 1 : 0)
   date.year - dob.year - (month_diff < 0 ? 1 : 0)
  end
end
