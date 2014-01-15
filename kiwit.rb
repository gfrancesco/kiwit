require "rubygems"
require "bundler/setup"

# require your gems as usual

require 'sinatra'
require 'haml'
require 'rack'
require 'sinatra/r18n'

AV_LOC = ['it', 'en']

before do
  @domain = request.env["SERVER_NAME"].split('.').last(2).join('.')
  @route = request.env["PATH_INFO"]
  subdomain_locale = request.env["SERVER_NAME"].split('.').first
  if AV_LOC.include? subdomain_locale
    session[:locale] = subdomain_locale
    @image_name = 'it'
    @subdomain_i18n = ''
  else
    session[:locale] = 'it'
    @image_name = 'en'
    @subdomain_i18n = 'en.'
  end
end

get '/' do
  haml :index
end

get '/about' do
  haml :about
end

get '/project' do
  haml :project
end

get '/development' do
  haml :development
end

get '/tech' do
  haml :tech
end

get '/contacts' do
  haml :contacts
end
