require 'sinatra'
require 'sinatra/json'
require 'woothee'

get '/parse' do
  ua = params[:ua]
  ua ||= request.user_agent
  json Woothee.parse(ua)
end

get '/api' do
  ua = params[:ua]
  ua ||= request.user_agent
  data = {
    version: Woothee::VERSION,
    result: Woothee.parse(ua)
  }
  json data
end
