source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

###

# Development
group :development do
  gem 'sqlite3'
end

# Deployment
gem 'capistrano'

group :production do
  # gem 'mysql2' # If using mysql in development, this can be outside the production group.
  gem 'therubyracer'
end

# Server
gem 'unicorn'

# Html5 for Rails - https://github.com/sporkd/html5-rails
group :assets do
  gem 'compass-rails'
  gem 'compass-h5bp'
end

gem 'haml-rails'
gem 'html5-rails'

# 960 Grid System Compass Plugin - https://github.com/nextmat/compass-960-plugin
gem 'compass-960-plugin', '~> 0.10.4'

# Navigation
gem 'simple-navigation', '~> 3.9.0'

# Authentication
gem 'devise', '~> 2.1.2'

# Turbolinks
gem 'turbolinks', '~> 0.5.1'

# Better Errors
group :development do
  gem "better_errors"
end

# Mannequin
gem 'mannequin'

# Rack::Timeout
gem 'rack-timeout'

# Rails 12factor
gem 'rails_12factor', group: :production
