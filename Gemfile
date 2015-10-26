source "https://rubygems.org"

ruby "2.2.3"

gem "airbrake"
gem "delayed_job_active_record"
gem "email_validator"
gem "flutie"
gem "high_voltage"
gem "i18n-tasks"
gem "newrelic_rpm", ">= 3.9.8"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 4.2.0"
gem "recipient_interceptor"
gem "simple_form"
gem "title"
gem "dotenv-rails"

# Frontend
gem "sass-rails", "~> 5.0"
gem "autoprefixer-rails"
gem "normalize-rails", "~> 3.0.0"
gem "bourbon", "~> 4.2.0"
gem "neat", "~> 1.7.0"
gem "refills"
gem "cssmin", "~> 1.0", ">= 1.0.3"
gem "jquery-rails"
gem "uglifier"
gem "gravtastic"

group :development do
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
  gem "warden"
  gem 'bcrypt'
end

group :development, :test do
  gem "awesome_print"
  gem "bundler-audit", require: false
  gem "byebug"
  gem "factory_girl_rails"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.3.0"
end

group :test do
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "rack-timeout"
end
