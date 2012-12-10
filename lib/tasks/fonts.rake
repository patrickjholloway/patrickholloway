namespace :fonts do
  task :scrape => :environment do
    font_file = IO.read('lib/fonts')
    fonts = ActiveSupport::JSON.decode(font_file)
    fonts["items"].each do |font|
      Font.create(data: font, name: font["family"])
    end
  end
end