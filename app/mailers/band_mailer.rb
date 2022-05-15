# encoding: UTF-8
class BandMailer < ActionMailer::Base
  default :from => APP_CONFIG[:default_from_email_address]
  def custom_email(subject, recipients, content_markdown, content_plain)
    @content = content_markdown
    mail(to: APP_CONFIG[:default_from_email_address], bcc: recipients, subject: subject) do |format|
      format.html
      format.text { render plain: content_plain }
    end
  end

  def confirmation_email(band)
    @band = band
    @event = Event.first
    mail(to: band.email, subject: t(:band_signup_confirmation)) do |format|
      format.html
      format.text
    end
  end
end
