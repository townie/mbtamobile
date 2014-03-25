require 'sinatra'
require 'net/http'
require 'json'
require 'pry'

require_relative 'model/model_helper'

#home page request
get '/' do
  erb :index
end

get '/dobus' do
  erb :dobus
end

get '/:route' do
  @route = params[:route]
  stop = BusTimeChecker.new(@route).get_one_route

  @stops= stop["body"]["route"]["stop"]
  erb :onebus
end

get '/:route/:stop' do
  @stop = params["stop"].to_i
  @stop_data = BusTimeChecker.new(@stop).get_one_stop

  erb :display_one_stop
end

post '/bus' do

  lat = params["lat"].to_f
  long =params["long"].to_f
  @stops = BusStopLoader.new(lat,long).get_bus_stop_by_location
  @stop_list = (BusTimeChecker.new(@stops).get_bus_times)
  #@stop_list = FormatStops.new(stuff ).formalize_stops

  erb :bus
end




