source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.5.1'
gem 'rails'
gem 'pg'
gem 'rails_12factor', group: :production
gem 'dotenv-rails'
gem 'puma'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'bootsnap', require: false
gem 'rails-i18n'
gem 'simple_form'
gem 'activestorage'
gem 'aws-sdk-s3', require: false
gem 'clearance'
gem 'google-cloud-storage', require: false

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'rails-controller-testing'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development, :test do
  gem "rspec-rails"
  gem "factory_girl_rails"
end


group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'letter_opener'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'shoulda-matchers', require: false
end
