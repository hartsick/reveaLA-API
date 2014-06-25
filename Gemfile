source 'https://rubygems.org'

gem 'rails', '4.1.1'

gem 'rails-api'

gem 'spring', :group => :development

gem 'pg'
gem 'activerecord-postgis-adapter'
gem 'active_model_serializers'
gem 'validates_email_format_of', :git => 'git://github.com/alexdunae/validates_email_format_of.git'
gem 'geocoder'
gem 'rack-cors', :require => 'rack/cors'

group :test, :development do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'json_spec'
end

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

# rails_12factor for precompiling assets
gem 'rails_12factor'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

group :development do
  gem 'capistrano'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-postgresql', '~> 3.0'
  gem 'capistrano-rvm'
end

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
