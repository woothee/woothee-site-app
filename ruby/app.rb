require 'sinatra'
require 'sinatra/json'
require 'woothee'

set :public_folder, File.expand_path(__FILE__ + '/../../site')

get '/' do
  redirect "/index.html"
end

get '/parse' do
  ua = params[:ua]
  ua ||= request.user_agent
  json Woothee.parse(ua)
end
