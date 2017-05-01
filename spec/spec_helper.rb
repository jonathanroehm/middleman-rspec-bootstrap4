require 'rspec'
require 'middleman'
require 'capybara/rspec'
require 'middleman-core'
require 'middleman-core/rack'
require 'middleman-core/load_paths'
require 'middleman-livereload'
require 'middleman-sprockets'
require 'middleman-compass'

# Utilize spec support files like shared_examples
Dir["./spec/support/**/**/*.rb"].sort.each { |f| require f}

# Capybara & Selenium
prefered_browser = :chrome

Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  # Use Chrome (Firefox has a host of issues)
  Capybara::Selenium::Driver.new(app, browser: prefered_browser)
end

# Use an iPhone user agent
Capybara.register_driver :iphone do |app|
  Capybara::RackTest::Driver.new(app, browser: prefered_browser, headers: { 'HTTP_USER_AGENT' => 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_0 like Mac OS X) AppleWebKit/602.1.38 (KHTML, like Gecko) Version/10.0 Mobile/14A5297c Safari/602.1' })
end

RSpec.configure do |config|
 config.include Capybara::DSL
end

# Configure middleman
Middleman.setup_load_paths
middleman_app = ::Middleman::Application.new

Capybara.app = ::Middleman::Rack.new(middleman_app).to_app do
  set :root, File.expand_path(File.join(File.dirname(__FILE__), '..'))
  set :environment, :development
  set :show_exceptions, false
end

# Allow 'by' 'and_by' in specs
def by(message)
  if block_given?
    yield
  else
    pending message
  end
end

alias and_by by