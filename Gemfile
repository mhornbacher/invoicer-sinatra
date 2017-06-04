source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem "sinatra-contrib", require: false # This is for Hot Reloading
gem 'rake'
gem 'require_all'
gem 'sqlite3'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt' # on windows check readme for instrucitons

group :development do
 gem 'sqlite3'
 gem "tux"
end

#This will allow us to use Postgres on Heroku
group :production do
 gem 'pg'
end

# For the testing suite
group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end