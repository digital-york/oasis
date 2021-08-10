source 'https://rubygems.org'

#ruby '~> 2.6.5'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
# Production secrets management
gem 'figaro'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4.6'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 4.3.8'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.4.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Add clamav for virus checking
# gem 'clamav' 

gem 'loofah', '~> 2.3.1'
gem 'rails-html-sanitizer', '~> 1.0.4'
gem 'nokogiri', '~> 1.11.4'
gem 'mini_magick', '~> 4.9.5'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do
  # Standalone passenger
  gem 'passenger', '~> 5.2.0'
  # Postgres DB
  gem 'pg', '~> 1.2.3'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'browse-everything', '~> 0.16.1'
gem 'hyrax', '~> 2.9.5'
gem 'sinatra', '~> 2.0.2'
gem 'ffi', '~> 1.9.24'
gem 'rubyzip', '~> 1.3.0'
gem 'sprockets', '~> 3.7.2'

gem 'hydra-role-management'
gem 'blacklight-access_controls', '0.6.2'
gem "activesupport", ">= 5.2.4.3"
gem "simple_form", ">= 5.0.0"

group :development, :test do
  gem 'solr_wrapper', '>= 0.3'
  gem 'xray-rails'
  gem 'pry-rails'
  gem 'pry-byebug'
end

gem 'rsolr', '>= 1.0'
gem 'jquery-rails'
gem "devise", ">= 4.7.1"
gem 'devise-guests', '~> 0.6'
group :development, :test do
  gem 'fcrepo_wrapper'
  gem 'rspec-rails'
end

gem 'resque', :require => 'resque/server'

