# If you do not have OpenSSL installed, change
# the following line to use 'http://'
source 'https://rubygems.org'

gem 'bootstrap', '~> 4.0.0.beta'

# Middleman Gems
gem 'middleman', '>= 4.0.0'
gem 'middleman-compass', '>= 4.0.0'
gem 'middleman-livereload', '~> 3.4.3'
gem 'middleman-sprockets'

source 'https://rails-assets.org' do
  gem 'rails-assets-jquery'
end

group :test do
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'rspec'
  gem 'capybara'
end

# For faster file watcher updates on Windows:
gem 'wdm', '~> 0.1.0', platforms: [:mswin, :mingw]

# Windows does not come with time zone data
gem 'tzinfo-data', platforms: [:mswin, :mingw, :jruby]
