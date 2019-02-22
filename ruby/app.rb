require 'sinatra'
require 'sinatra/json'
require 'woothee'

get '/parse' do
  ua = params[:ua]
  ua ||= request.user_agent
  response.headers['Access-Control-Allow-Origin'] = '*'
  json Woothee.parse(ua)
end

get '/api' do
  ua = params[:ua]
  ua ||= request.user_agent
  data = {
    version: Woothee::VERSION,
    result: Woothee.parse(ua)
  }
  response.headers['Access-Control-Allow-Origin'] = '*'
  json data
end
