# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '>=2.7.3'

gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4'
gem "sprockets-rails"
gem 'sassc-rails', require: false
gem 'redis', '~> 4.0'

gem 'bootsnap', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'rails-i18n', '~> 6.0.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'hotwire-rails'
gem 'view_component'

group :development do
  gem 'capistrano', require: false
  gem 'capistrano3-delayed-job'
  gem 'capistrano-passenger'
  gem 'capistrano-rails', require: false
  gem 'capistrano-yarn'
  gem 'guard'
  # gem 'guard-bundler'
  gem 'guard-livereload', require: false
  # gem 'guard-puma'
  gem 'libnotify'
  gem 'listen', '~> 3.3'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'web-console', '>= 4.1.0'
end

group :test, :development do
  gem 'dotenv'
  gem 'guard-rspec', require: false
  gem 'railroady'
  gem 'rspec-rails'
end

group :test do
  gem 'apparition'
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'launchy'
  gem 'shoulda-matchers', require: false
end

gem 'asciidoctor'
gem 'cancancan'
gem 'lockbox'
gem 'pp'
gem 'simple_form'
gem 'wobapphelpers', git: 'https://github.com/swobspace/wobapphelpers', branch: 'master'
gem 'wobauth', git: 'https://github.com/swobspace/wobauth.git', branch: 'master'
gem 'wobmire', git: 'https://github.com/swobspace/wobmire', branch: 'master'
# gem 'sidekiq'
# gem 'sidekiq-scheduler'
gem 'daemons'
gem 'delayed_cron_job'
gem 'delayed_job_active_record'

# workaround for faraday-net_http
gem 'net-http'

gem 'chartkick', '~> 4.0'
gem 'draper'
gem 'kramdown'
gem 'uri', '0.10.0'

gem 'responders', git: 'https://github.com/heartcombo/responders.git', branch: 'main'

gem 'jsbundling-rails'
gem 'cssbundling-rails'
