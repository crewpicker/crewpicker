class BandMailer < ActionMailer::Base
  default :from => "festival@rockmotrus.no"
  def extrainfo_email
    bands = Band.all
    bands.each do |band|
      @band = band
      mail(:to => "tg90nor@gmail.com", :subject => 'Spørsmål til bandpresentasjon')
    end
  end
end
