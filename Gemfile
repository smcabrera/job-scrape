source 'https://rubygems.org'

gem 'autoprefixer-rails'
gem 'bootstrap-sass', '~> 3.3.3'
gem 'coffee-rails', '~> 4.0.0'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails', '~> 4.0.3'
gem 'mechanize', '~> 2.7.3'
gem 'nav_lynx', '~> 1.1.1'
gem 'paranoia', '~> 2.1.0'
gem 'rails', '~> 4.2.0'
gem 'sass-rails', '>= 3.2'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'sqlite3'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'jazz_fingers'
  gem 'rspec-rails', '~> 3.0', group: :test
  gem 'spring', '~> 1.2.0'
  gem 'quiet_assets', group: :development
end

group :test do
  gem 'capybara', '~> 2.2.0'
end

#IMPORTANT! Some of the defaults have changed in Capybara 2.1. If you're experiencing failures,
#please revert to the old behaviour by setting:

    #Capybara.configure do |config|
      #config.match = :one
      #config.exact_options = true
      #config.ignore_hidden_elements = true
      #config.visible_text_only = true
    #end

#If you're migrating from Capybara 1.x, try:

    #Capybara.configure do |config|
      #config.match = :prefer_exact
      #config.ignore_hidden_elements = false
    #end

#Details here: http://www.elabs.se/blog/60-introducing-capybara-2-1

