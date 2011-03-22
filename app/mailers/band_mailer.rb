class BandMailer < ActionMailer::Base
  default :from => "Rock Mot Rus <festival@rockmotrus.no>"
  def extrainfo_email
    mail(:to => "tg90nor@gmail.com", :subject => 'Spørsmål til bandpresentasjon').deliver
    bands = Band.all
    bands.each do |band|
      @band = band
      mail(:to => band.email, :subject => 'Spørsmål til bandpresentasjon').deliver
    end
  end
end
