source 'http://gemcutter.org'
require 'open-uri'
ruby "1.9.3"

gem 'rails', '3.2.11'
gem 'rake', '10.0.2'
gem 'sass-rails', git: 'https://github.com/rails/sass-rails.git', branch: '3-2-stable'
gem 'valid_email', :require => 'valid_email/email_validator'
gem "mail", "2.4.4"
gem 'mongo', :git => 'git://github.com/mongodb/mongo-ruby-driver.git'
gem 'bson_ext'
gem "mongoid", "~> 3.0.14"
gem 'client_side_validations' # ajaxified client validations matched with model validations
gem 'client_side_validations-mongoid'
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails', # twitter bootstrap
                              :git => 'git://github.com/anjlab/bootstrap-rails.git'
gem 'haml-rails'
gem 'rdiscount'
gem 'backbone-on-rails'
gem "devise", "~> 2.1.2"
gem "kaminari-bootstrap", "~> 0.1.3"
gem 'google-webfonts'

group :development, :test do
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'hpricot'
  gem 'ruby_parser'
end

group :test do
  gem 'capybara'
  gem 'rb-fsevent', :require => false
  gem 'growl'
  gem 'guard-spork', '1.2.0'
  gem 'spork', '0.9.2'
  gem 'factory_girl_rails'
end

group :production do
  gem 'thin'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'jquery-rails'
  gem 'jquery-ui-rails'
  gem 'uglifier', '>= 1.0.3'
  gem "haml_coffee_assets", "~> 1.8.2"
  gem 'execjs'
end