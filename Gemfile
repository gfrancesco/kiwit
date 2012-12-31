source "http://rubygems.org"

gem "sinatra", "~> 1.3"
gem "haml"
gem "sinatra-r18n", :git => 'https://github.com/ai/r18n.git'

group :development, :test do
  gem "rvm-capistrano"
  gem 'capistrano-unicorn', github: 'sosedoff/capistrano-unicorn', require: false
end

group :production do
  gem 'unicorn'
end