PDFKit.configure do |config|
  config.default_options = {
    :page_size => 'A4',
    :disable_smart_shrinking => false,
    :encoding=>"UTF-8"
  }
end
