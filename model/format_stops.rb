require_relative 'model_helper'

class FormatStops

  def initialize(stop_list)
    @stop_list = stop_list

  end

  def formalize_stops
    stop_array = []


    clean = @stop_list[0]['body']

    @stop_list.each_with_index do | bus_stop |
      inner_stop_array= []

       if !bus_stop.include?('error')

        # clean = bus_stop['predictions']
          clean.each_with_index do |at_this_stop_routes, index|
            s = BusStop.new()

            s.bus_route= at_this_stop_routes[1][index]["routeTitle"]

              if at_this_stop_routes[1][index]["dirTitleBecauseNoPredictions"].nil?
                s.perdictions = at_this_stop_routes[1][index]["dirTitleBecauseNoPredictions"]
              else
                s.perdictions = at_this_stop_routes[1][index]['direction']["perdictions"]
              end
            s.route_tag = at_this_stop_routes[1][index]['routeTag']
            inner_stop_array<< s
          end
      else
        inner_stop_array<<BusStop.new("THIS IS A TRAIN STOP")
      end

      stop_array<<inner_stop_array

    end
    stop_array
  end


end
