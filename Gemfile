# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'bcrypt', '~> 3.1.7'
gem 'jwt', '~> 2.2', '>= 2.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.3'
# Use Active Storage variant
# gem 'image_processing',     '~> 1.2'
gem 'cpf_cnpj', '~> 0.5.0'
gem 'rack-attack', '~> 6.3', '>= 6.3.1'
gem 'rack-cors'

group :development, :test do
  gem 'awesome_print', '~> 1.8'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'ffaker', '~> 2.17'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'

  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'shoulda-matchers', '~> 4.4', '>= 4.4.1'
end
group :development do
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
