source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0'
# Use mysql as the database for Active Record
gem 'mysql2', '0.5.1'
# Use Puma as the app server
gem 'puma', '4.3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem "rack", ">= 2.2.3"

gem 'acts-as-taggable-on'
gem 'stock_quote'
gem 'redis'
gem 'redis-namespace'
gem 'redis-rails'
gem 'redis-rack-cache'
gem 'groupdate'
gem 'chartkick'
gem 'iex-ruby-client'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise'
gem 'bootstrap-sass'
gem 'jquery-rails'
gem 'rolify'
gem 'high_voltage'
gem 'kaminari'
gem 'rails_admin'
gem 'datagrid'
gem 'spreadsheet'
gem 'libxml-ruby'
gem 'rspreadsheet'
gem 'money-rails'
gem 'ffi'
gem 'autoprefixer-rails'
gem "seedbank"
gem "nokogiri"
gem 'mini_portile2'
gem 'rails-erd', group: :development
gem 'net-ftp'
gem 'net-smtp'
gem 'pry'
gem 'pry-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  #gem 'selenium-webdriver', '3.12.0'
  #gem 'webdrivers'
  gem 'simplecov', require: false, group: :test
  gem 'rails-controller-testing'
  gem 'dotenv-rails'
  gem 'dotenv'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
  #gem 'spring-commands-rspec'
  gem 'vcr'
  gem 'rails_layout'
end

gem 'sassc-rails'
