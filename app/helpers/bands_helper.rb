module BandsHelper
  def nl2br(s)
    s.gsub(/\n/, "<br>").html_safe
  end
end
