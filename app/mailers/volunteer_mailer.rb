class VolunteerMailer < ActionMailer::Base
  default from: "Rock Mot Rus <festival@rockmotrus.no>"
  def custom_email(subject, recipients, content_markdown, content_plain)
    @content = content_markdown
    mail(:to => recipients, :subject => subject) do |format|
      format.html
      format.text { render text: content_plain }
    end
  end
end
