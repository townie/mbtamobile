require_relative 'model_helper'

class BusStop
  attr_accessor :stop_id, :bus_route, :route_tag, :perdictions

  def initialize(stop_id ='',bus_route='',route_tag='',predictions= [])
    @stop_id = stop_id
    @bus_route = bus_route
    @route_tag = route_tag
    @perdictions = perdictions
  end


end
