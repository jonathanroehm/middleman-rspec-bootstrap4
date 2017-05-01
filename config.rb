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

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

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

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

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