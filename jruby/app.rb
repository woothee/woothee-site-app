require 'sinatra'
require 'sinatra/json'
require './woothee.jar'

set :public_folder, File.expand_path(__FILE__ + '/../../site')

get '/' do
  redirect "/index.html"
end

get '/parse' do
  ua = params[:ua]
  ua ||= request.user_agent
  json Java::IsTagomorWoothee::Classifier.parse(ua)
end
