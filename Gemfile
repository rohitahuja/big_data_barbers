source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use postgresql as the database for Active Record
gem 'pg'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# API tools
gem 'rails-api'
gem 'active_model_serializers'

# Rack Cors
gem 'rack-cors'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Authentication
gem 'devise'

# # Stylesheets
# gem 'foundation-rails'

# Phone validations
gem 'phony_rails'

# Use Twilio
gem 'twilio-ruby'

# Use delayed job for running background jobs
gem 'delayed_job_active_record'

# Need daemons to start delayed_job
gem 'daemons'

# Image uploading
gem 'refile', require: 'refile/rails'
gem 'refile-mini_magick'

# Alternative web server
gem 'thin'

group :development, :test do
  # Generate fake data
  gem 'faker'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Testing framwork
  gem 'rspec-rails', '~> 3.0'

  # Best debugging tool
  gem 'pry'

  # Use .env file for environment variables
  gem 'dotenv-rails'
end

