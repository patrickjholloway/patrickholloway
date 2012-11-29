source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'rake', '10.0.2'
gem 'devise'
gem "activerecord-postgres-hstore", "~> 0.4.1"
gem 'valid_email', :require => 'valid_email/email_validator'
gem 'bootstrap-will_paginate' # auto pagination of bootstrap pages
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "mail", "2.4.4"
gem 'client_side_validations' # ajaxified client validations matched with model validations
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails', # twitter bootstrap
                              :git => 'git://github.com/anjlab/bootstrap-rails.git'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'guard-rspec'
end

group :development do
  gem 'haml-rails'
  gem 'hpricot'
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
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', git: 'https://github.com/rails/sass-rails.git', branch: '3-2-stable'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'jquery-rails'
  gem 'jquery-ui-rails'
  gem 'uglifier', '>= 1.0.3'
  gem 'execjs'
  gem 'therubyracer'
end