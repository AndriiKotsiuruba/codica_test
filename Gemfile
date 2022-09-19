# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.6"

gem "aasm", "~> 5.3"
gem "activeadmin", "~> 2.13", ">= 2.13.1"
gem "aws-sdk-s3", "~> 1.14", require: false
gem "bootsnap", ">= 1.4.4", require: false
gem "cancancan", "~> 3.4"
gem "devise", "~> 4.8", ">= 4.8.1"
gem "draper", "~> 4.0", ">= 4.0.2"
gem "dry-validation", "~> 1.8", ">= 1.8.1"
gem "factory_bot_rails", "~> 6.2"
gem "ffaker", "~> 2.21"
gem "haml", "~> 5.2", ">= 5.2.2"
gem "jbuilder", "~> 2.7"
gem "pagy", "~> 5.10"
gem "pg", "~> 1.3", ">= 1.3.5"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.6"
gem "reform", "~> 2.6", ">= 2.6.2"
gem "reform-rails", "~> 0.2.3"
gem "sass-rails", ">= 6"
gem "shrine", "~> 3.4"
gem "simple_calendar", "~> 2.4"
gem "simple_form", "~> 5.1"
gem "turbolinks", "~> 5"
gem "twilio-ruby", "~> 5.72"
gem "webpacker", "~> 5.0"

group :development, :test, :circleci do
  gem "byebug", "~> 11.1", platforms: %i[mri mingw x64_mingw]
  gem "pry", "~> 0.13.1"
end

group :development do
  gem "fasterer", "~> 0.1.9"
  gem "listen", "~> 3.3"
  gem "overcommit", "~> 0.58.0"
  gem "rack-mini-profiler", "~> 2.0"
  gem "rubocop", "~> 1.29", ">= 1.29.1", require: false
  gem "rubocop-performance", "~> 1.14"
  gem "rubocop-rails", "~> 2.14", ">= 2.14.2"
  gem "rubocop-rspec", "~> 2.11", ">= 2.11.1"
  gem "spring", "~> 4.0"
  gem "web-console", ">= 4.1.0"
end

group :test, :circleci do
  gem "capybara", ">= 3.26"
  gem "rails-controller-testing", "~> 1.0", ">= 1.0.5"
  gem "rspec-rails", "~> 5.0.0"
  gem "selenium-webdriver", "~> 4.1"
  gem "shoulda-matchers", "~> 5.0"
  gem "simplecov", "~> 0.21.2"
  gem "site_prism", "~> 3.7.0"
end
