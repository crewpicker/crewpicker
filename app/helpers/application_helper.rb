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
end
