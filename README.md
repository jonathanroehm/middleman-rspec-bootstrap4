# middleman-rspec-bootstrap v1.0
A basic "starting point" middleman app that uses my favorite tools and has example files ready to use.

Inspiration and starter points for RSpec is from [simonrice's](https://github.com/simonrice) [middleman-rspec](https://github.com/simonrice/middleman-rspec). Lots of appreciation.

## TLDR; 
A walkthrough is down below, but get up and running quickly by following these commands... This assumes you have [ruby](https://www.ruby-lang.org/en/documentation/installation/), [homebrew](https://brew.sh) and [Google Chrome](https://www.google.com/chrome/) setup and in place on your machine. If you don't have those, get them in place first.

Clone the repo (if copying and pasting the commands below, don't copy the $ sign into your terminal):
````
Install Middleman
$ gem install middleman

From within your root project folder, eg: /Users/jonathanroehm/projects/
$ git clone https://github.com/jonathanroehm/middleman-rspec-bootstrap.git

From within your app, e.g: /Users/jonathanroehm/projects/middleman-rspec-bootstrap/ bundle the gems
$ bundle exec bundle

Install ChromeDriver
$ homebrew install chromedriver

Run the pre-loaded specs:
$ bundle exec rspec
````

Run the app (browsable on your machine at http://localhost:4567):
````
$ middleman server
````

Build your files:
````
$ middleman build
````

# Everything else:

## Tools
1. HAML
2. CoffeeScript
3. RSpec & Capybara
  * Feature specs
  * shared examples (it_behaves_like 'somethign')
4. I18n
  * en.yml
5. Bootstrap 4
  * Currently v4.0.0 alpha 6
6. FontAwesome4

If you stumbled here because you were looking for help in getting Middleman setup with RSpec, this should be a useful app for you. Follow the docs and you should be up and running in no time. For the uninitiated, the '$' symbol is just a visual cue that you should type in the following code in terminal. Don't actually copy in the '$' sign.


# Getting Started
This'll walk you through the though process behind how this setup is handy. 

## Install middleman
If you do not have middleman installed locally, run the command below.
````
$ gem install middleman
`````

## Cloning repo
After you clone this repo locally, be sure to run **bundle install**.
Basic setup once in your normal projects root folder, clone the app:
````
$ git clone https://github.com/jonathanroehm/middleman-rspec-bootstrap.git
$ bundle exec bundle
````


## Working in middleman
All files should go into the source directories.


## Starting middleman
To see live updates in your browser, at the root of the project in terminal run the command below and follow the displayed instructions

````
$ middleman server
````

## To build the html files, run:

````
$ middleman build
````

All of the assets will be created in a build folder.

## Setting up a convenient config.rb in my_app/config.rb file
See individual walkthrough and then the full config.rb file below:

Getting I18n and relative files and links setup:

````ruby
###
# Page options, layouts, aliases and proxies
###

activate :i18n
activate :relative_assets
set :relative_links, true
set :relative_assets, true
````

Make life easier with livereload and sprockets
````ruby
# General configuration
configure :development do
  activate :livereload
  activate :sprockets do |c|
    c.expose_middleman_helpers = true
  end

  if defined? RailsAssets
    RailsAssets.load_paths.each do |path|
      sprockets.append_path path
    end
  end
end
````

Build only a single minified application.js and application.css instead of every source file (cut down on those http requests and speed up your site):
````ruby
# Build-specific configuration
configure :build do
  activate :sprockets do |c|
    c.expose_middleman_helpers = true
  end

  # Minify CSS on build
  activate :minify_css
  # Don't pump out source CSS files
  ignore %r{stylesheets/(?!application\.css).*$}

  # Minify Javascript on build
  activate :minify_javascript
  # Don't pump out source JS files
  ignore %r{javascripts/(?!application\.js).*$}
end
````

All together, config.rb:
````ruby
# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions
ignore 'README.md'

# Layouts
# https://middlemanapp.com/basics/layouts/

###
# Page options, layouts, aliases and proxies
###

activate :i18n
activate :relative_assets
set :relative_links, true
set :relative_assets, true

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# General configuration
configure :development do
  activate :livereload
  activate :sprockets do |c|
    c.expose_middleman_helpers = true
  end

  if defined? RailsAssets
    RailsAssets.load_paths.each do |path|
      sprockets.append_path path
    end
  end
end

# Build-specific configuration
configure :build do
  activate :sprockets do |c|
    c.expose_middleman_helpers = true
  end

  # Minify CSS on build
  activate :minify_css
  # Don't pump out source CSS files
  ignore %r{stylesheets/(?!application\.css).*$}

  # Minify Javascript on build
  activate :minify_javascript
  # Don't pump out source JS files
  ignore %r{javascripts/(?!application\.js).*$}
end
````

## Gems
Getting rspec and everything else in place:

The useful Middleman gems:
````ruby
# Middleman Gems
gem 'middleman', '>= 4.0.0'
gem 'middleman-livereload', '~> 3.4.3'
gem 'middleman-compass', '>= 4.0.0'
gem 'middleman-sprockets'
````

Secondary tools: Bootstrap, Font Awesome, JQuery, HAML
````ruby
gem 'haml'
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'font-awesome-sass', '~> 4.7.0'

source 'https://rails-assets.org' do
  gem 'rails-assets-jquery'
  gem 'rails-assets-tether', '>= 1.3.3'
end
````

Getting the testing gems in place:
````ruby
group :test do
  gem 'selenium-webdriver'
  gem 'rspec'
  gem 'capybara'
end
````

All together, my_app/Gemfile
````ruby
# If you do not have OpenSSL installed, change
# the following line to use 'http://'
source 'https://rubygems.org'

# Middleman Gems
gem 'middleman', '>= 4.0.0'
gem 'middleman-livereload', '~> 3.4.3'
gem 'middleman-compass', '>= 4.0.0'
gem 'middleman-sprockets'

gem 'haml'
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'font-awesome-sass', '~> 4.7.0'

source 'https://rails-assets.org' do
  gem 'rails-assets-jquery'
  gem 'rails-assets-tether', '>= 1.3.3'
end

group :test do
  gem 'selenium-webdriver'
  gem 'rspec'
  gem 'capybara'
end

# For faster file watcher updates on Windows:
gem 'wdm', '~> 0.1.0', platforms: [:mswin, :mingw]

# Windows does not come with time zone data
gem 'tzinfo-data', platforms: [:mswin, :mingw, :jruby]
````

## Configuring RSpec

1. Create a 'spec' folder in your app's root folder: my_app/spec/
2. Add spec_helper.rb; so within my_app/spec/spec_helper.rb

Within my_app/spec/spec_helper:

Require these:
````ruby
require 'rspec'
require 'middleman'
require 'capybara/rspec'
require 'middleman-core'
require 'middleman-core/rack'
require 'middleman-core/load_paths'
require 'middleman-livereload'
require 'middleman-sprockets'
require 'middleman-compass'
````

Add the ability to locate supporting spec files like shared_examples:
````ruby
# Utilize spec support files like shared_examples
Dir["./spec/support/**/**/*.rb"].sort.each { |f| require f}
````

Setup your feature spec's browser:
````ruby
# Capybara & Selenium
prefered_browser = :chrome

Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  # Use Chrome (Firefox has a host of issues)
  Capybara::Selenium::Driver.new(app, browser: prefered_browser)
end
````

Add iPhone driver for iPhone feature tests
````ruby
# Use an iPhone user agent
Capybara.register_driver :iphone do |app|
  Capybara::RackTest::Driver.new(app, browser: prefered_browser, headers: { 'HTTP_USER_AGENT' => 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_0 like Mac OS X) AppleWebKit/602.1.38 (KHTML, like Gecko) Version/10.0 Mobile/14A5297c Safari/602.1' })
end
````

Add 'by' and 'and_by' to your specs (to help speed up tare down and rebuilds associated with each 'it' statement):
````ruby
# Allow 'by' 'and_by' in specs
def by(message)
  if block_given?
    yield
  else
    pending message
  end
end

alias and_by by
````

And everything else, all together:
````ruby
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
````

## Running RSpec
This app uses Google Chrome for feature specs. You'll need to have the Chrome browser installed and in its usual path for everything to run easily. 

To run RSpec:
````
bundle exec rspec
````

## RSpec files
To add a new spec, go to my_app/spec/features/ and add a new feature spec and add _spec.rb to the filename, e.g.: 

````
my_app/spec/features/index_spec.rb
````

To get a barebones feature spec up and running, in my_app/spec/features/index_spec.rb
````ruby
require 'spec_helper'

describe 'the index page', type: :feature, js: true do
  before { visit '/index.html' }
  it 'is the index page' do
    by 'being the index page' do
      expect(current_path).to eq '/index.html'
    end  
    and_by 'having the index page heading' do
      expect(page).to have_text I18n.t('index.headings.page')
    end
  end
end
````

Then run this spec specifically:
````
$ bundle exec rspec spec/features/index_spec.rb
````

You can also run specific lines in rspec (e.g.: if you run a test and get a specific error on a specific line, you don't have to re-run the full test over again)... so to run line 32, for example:
````
$ bundle exec rspec spec/features/index_spec.rb:32
````

And, of course, if you want to run your entire test suite:
````
$ bundle exec rspec
````

This is what a simple rspec output looks like:
````
== Locales: en (Default en)
== LiveReload accepting connections from ws://10.0.0.182:35729
.

Finished in 7.68 seconds (files took 5.03 seconds to load)
1 example, 0 failures
````


## My wishlist & things I would like to figure out / add:
1. Have RSpec run against just built files to make sure that the built files are working exactly as expected. I found this [forum post](https://forum.middlemanapp.com/t/testing-in-middleman/1972/2) enlightening.
2. Within feature specs, have the iPhone driver actually open up the browser so I can watch the action realtime (I am investigating some gems that may make this whole thing easier for user agent / device testing).
3. Slightly more fleshed out examples and an actual basic starter app that has a little bit of everything mixed in for useful starting points for new apps or learning tools for folks like me who stumbled through this process until it finally worked :)
