require 'json'
require 'httparty'

class BusTimeChecker


  def initialize(stops_data, just_stop_id = [])
    @stops_data = stops_data
    @just_stop_id = just_stop_id
  end

  def populate_just_stop_id
    @stops_data.map{ |point| point["stop_id"] }
  end

  def create_string_for_url(array)
    string = ""
    array.each do |stop_id|
        string<<"&stops=#{stop_id}"
    end
    return string
  end


   def get_bus_times
     array = populate_just_stop_id


     res = []
    array.each do |stop_id|
      res << HTTParty.get("http://webservices.nextbus.com/service/publicXMLFeed?command=predictions&a=mbta&stopId=#{stop_id}")
    end



     # binding.pry
     res

  end


end
