# encoding: UTF-8
class BandMailer < ActionMailer::Base
  # TODO: set default from address in config file
  default :from => APP_CONFIG[:default_from_email_address]
  def custom_email(subject, recipients, content_markdown, content_plain)
    @content = content_markdown
    mail(to: APP_CONFIG[:default_from_email_address], bcc: recipients, subject: subject) do |format|
      format.html
      format.text { render text: content_plain }
    end
  end
end
