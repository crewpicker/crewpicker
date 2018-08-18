PDFKit.configure do |config|
  config.wkhtmltopdf = APP_CONFIG[:wkhtmltopdf_path] ? APP_CONFIG[:wkhtmltopdf_path] : '/usr/bin/wkhtmltopdf'
  config.default_options = {
    :page_size => 'A4',
    :disable_smart_shrinking => true,
    :encoding=>"UTF-8"
  }
end
