# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.5'

gem 'active_storage_validations', '0.9.8'
gem 'bcrypt', '3.1.18'
gem 'faker', '2.21.0'
gem 'bootsnap'
gem 'image_processing', '1.12.2'
gem 'importmap-rails', '1.1.5'
gem 'jbuilder',        '2.11.5'
gem 'jquery-rails'
gem 'kaminari'
gem 'puma', '5.6.8'
gem 'rails', '7.0.4.3'
gem 'sassc-rails',     '2.1.2'
gem 'sprockets-rails', '3.4.2'
gem 'sqlite3',         '1.6.1'
gem 'stimulus-rails',  '1.2.1'
gem 'turbo-rails',     '1.4.0'

group :development, :test do
  gem 'debug', '1.7.1', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'dotenv-rails'
  gem 'erb_lint'
  gem 'htmlbeautifier'
  gem 'irb', '1.10.0'
  gem 'repl_type_completor', '0.1.2'
  gem 'rubocop'
  gem 'rubocop-ast'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rake'
  gem 'rubocop-rspec'
  gem 'solargraph', '0.50.0'
  gem 'web-console', '4.2.0'
end

group :production do
  gem 'aws-sdk-s3', '1.114.0', require: false
end

group :test do
  gem 'capybara',                 '3.38.0'
  gem 'guard',                    '2.18.0'
  gem 'guard-minitest',           '2.4.6'
  gem 'minitest',                 '5.18.0'
  gem 'minitest-reporters',       '1.6.0'
  gem 'rails-controller-testing', '1.0.5'
  gem 'selenium-webdriver',       '4.8.3'
  gem 'webdrivers',               '5.2.0'
end

# Windows ではタイムゾーン情報用の tzinfo-data gem を含める必要があります
# gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "tailwindcss-rails", "~> 2.7"
