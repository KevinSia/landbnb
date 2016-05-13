source 'https://rubygems.org'

# Use Unicorn as the app server
# gem 'unicorn'

# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'rails', '4.2.5.1'
gem 'pg', '~> 0.15'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bcrypt', '~> 3.1.7'
gem 'will_paginate'

# not friendly with simple_form bootstrap setting
# changing to geocoder soon
gem 'country_state_select', '3.0.1'

# gem 'slim-rails'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'

# application.yml
gem 'figaro'

# authentication
gem 'clearance'
gem 'omniauth'
gem 'omniauth-facebook'

# datepicker
gem 'momentjs-rails'
gem 'bootstrap-daterangepicker-rails'

# image upload
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'mini_magick'

# braintree payment
gem 'braintree'

# background job
gem 'sidekiq'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'launchy'
  gem 'letter_opener'
  gem 'byebug'
  gem 'rspec'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'fog'
end

