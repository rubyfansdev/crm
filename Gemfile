source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'

gem 'sqlite3', '~> 1.4'

gem 'cssbundling-rails'
gem 'devise'
gem 'devise-i18n'
gem 'dotenv-rails'
gem 'jsbundling-rails'
gem 'puma', '~> 6.0'
gem 'pundit'
gem 'rails-i18n'
gem 'redis', '~> 4.0'
gem 'sassc-rails'
gem 'sidekiq'
gem 'simple_form'
gem 'slim-rails', '~> 3.6.1'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

group :development, :test do
  gem 'bullet'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker'
  gem 'rspec-rails', '~> 6.0.0'
end

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-i18n', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'web-console'
end
