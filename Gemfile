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
gem 'apipie-rails', github: 'Apipie/apipie-rails', ref: '928bd858fd14ec67eeb9483ba0d43b3be8339608'

# Rack Cors
gem 'rack-cors'

# Authentication
gem 'omniauth'
gem 'devise'
gem 'devise_token_auth', '0.1.32.beta8'

# Authorization
gem 'pundit'

# Phone validations
gem 'phony_rails'

# Use Twilio
gem 'twilio-ruby'

# Use delayed job for running background jobs
gem 'delayed_job_active_record'

# Need daemons to start delayed_job
gem 'daemons'

# Image uploading
gem 'fog', require: 'fog/aws'
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'

# Alternative web server
gem 'thin'

group :test do
  gem "codeclimate-test-reporter", require: nil
end

group :development, :test do
  # Generate fake data
  gem 'faker'

  # Factory builder for resources
  gem 'factory_girl_rails'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Testing framwork
  gem 'rspec-rails', '~> 3.0'

  # Best debugging tool
  # gem 'pry'
  gem 'pry-byebug'

  # Use .env file for environment variables
  gem 'dotenv-rails'
end

