source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails',                  '~> 6.0.3', '>= 6.0.3.3'
gem 'pg',                     '>= 0.18', '< 2.0'
gem 'puma',                   '~> 4.1'
# gem 'bcrypt',               '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing',     '~> 1.2'

# gem 'rack-cors'

group :development, :test do
  gem 'byebug',               platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails',          '~> 4.0', '>= 4.0.1'
  gem 'factory_bot_rails',    '~> 6.1'
  gem 'dotenv-rails',         '~> 2.7', '>= 2.7.6'
  gem 'pry-rails',            '~> 0.3.9'
  gem 'awesome_print',        '~> 1.8'
end

group :development do
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
