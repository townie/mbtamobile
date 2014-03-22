require 'sinatra'
require 'pry'
require 'net/http'
require 'json'

require_relative 'model/model_helper'

#home page request
get '/' do
  erb :index
end

post '/loc' do

  erb '/params[:long]'
end

get '/:long' do
  erb :bus
end

post '/bus' do
  lat = params["lat"].to_f
  long =params["long"].to_f
  @stops = BusStopLoader.new(lat,long).get_bus_stop_by_location


  erb :bus
end

get '/train' do
  erb :train
end

get '/bus_train' do
  erb :bus_train
end
