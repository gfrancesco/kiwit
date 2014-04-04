source 'https://rubygems.org'
ruby "2.1.1"

gem "sinatra", "~> 1.3"
gem "haml"
gem "sinatra-r18n"

group :development, :test do
  gem 'capistrano-unicorn', github: 'sosedoff/capistrano-unicorn', require: false
end

group :production do
  gem 'unicorn'
  gem 'thin'
end