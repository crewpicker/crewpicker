class VolunteerMailer < ActionMailer::Base
  default from: "***REMOVED***"
  def custom_email(subject, recipients, content_markdown, content_plain)
    @content = content_markdown
    mail(:to => '***REMOVED***', :bcc => recipients, :subject => subject) do |format|
      format.html
      format.text { render text: content_plain }
    end
  end
end
