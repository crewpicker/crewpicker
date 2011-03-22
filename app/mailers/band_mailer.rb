class BandMailer < ActionMailer::Base
  default :from => "festival@rockmotrus.no"
  def extrainfo_email
    mail(:to => "tg90nor@gmail.com", :subject => 'Spørsmål til bandpresentasjon')
  end
end
