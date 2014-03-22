require_relative 'model_helper'

class FromatStops

  def initalize(stop_list, clean_stops= [])
    @stop_list = stop_list
    @clean_stops = clean_stops
  end

  def formalize_stops
    @stop_list.each_with_index do | bus_stop |

    bus_stop['body']['predictions']

    end

  end


end
