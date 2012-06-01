require "rubygems"
require "bundler/setup"

# require your gems as usual

require 'sinatra'
require 'haml'
require 'rack'
require 'sinatra/r18n'
#R18n.default_places = './i18n/'
#R18n.set 'it'
#set :environment, :production
#set :port, 80
set :default_locale, 'it'
#R18n.set R18n::I18n.new('it', options.translations)
AV_LOC = ['it', 'en']

#include R18n::Helpers



before do
  @domain = request.env["SERVER_NAME"].split('.').last(2).join('.')
  @route = request.env["PATH_INFO"]
  subdomain_locale = request.env["SERVER_NAME"].split('.').first
  if AV_LOC.include? subdomain_locale
    R18n.set subdomain_locale
    @image_name = 'it'
    @subdomain_i18n = ''
  else
    R18n.set('it')
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
