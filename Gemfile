source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.5.1'
gem 'rails', '~> 5.2.1'
gem 'pg', '~> 0.20'
gem 'rails_12factor', group: :production
gem 'dotenv-rails'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rails-i18n'
gem 'simple_form'
gem 'activestorage'
gem 'aws-sdk-s3', require: false
gem 'google-cloud-storage', '~> 1.11', require: false
gem 'clearance'

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'rails-controller-testing'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development, :test do
  gem "rspec-rails"
  gem "factory_girl_rails", "~> 4.4.1"
end


group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'faker'
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'shoulda-matchers', require: false
end
