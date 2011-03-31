class BandMailer < ActionMailer::Base
  default :from => "***REMOVED***"
  def extrainfo_email
    mail(:to => "tg90nor@gmail.com", :subject => 'Spørsmål til bandpresentasjon').deliver
    bands = Band.all
    bands.each do |band|
      @band = band
      mail(:to => band.email, :subject => 'Spørsmål til bandpresentasjon').deliver
    end
  end
  def musicvideo_email
    mail(:to => "tg90nor@gmail.com", :subject => 'Musikkvideo-konkurranse').deliver
    mail(:to => "susann.stave@rockmotrus.no", :subject => 'Musikkvideo-konkurranse').deliver
    mail(:to => "cato@rockmotrus.no", :subject => 'Musikkvideo-konkurranse').deliver
    bands = Band.all
    bands.each do |band|
      @band = band
      mail(:to => band.email, :subject => 'Musikkvideo-konkurranse').deliver
    end
  end
  def bandrekkefolge_email
    mail(:to => "tg90nor@gmail.com", :subject => 'Bandrekkefølgen').deliver
    mail(:to => "cato@rockmotrus.no", :subject => 'Bandrekkefølgen').deliver
    bands = Band.all
    bands.each do |band|
      @band = band
      mail(:to => band.email, :subject => 'Bandrekkefølgen').deliver
    end
  end
end
