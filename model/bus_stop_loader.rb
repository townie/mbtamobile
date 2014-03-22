require_relative 'model_helper'
class BusStopLoader

  attr_reader :long, :lat

  def initialize(long, lat, list_of_stops = [])
    @long = long
    @lat = lat
    @list_of_stops = list_of_stops
  end

  def get_bus_stop_by_location
    uri = URI("http://realtime.mbta.com/developer/api/v1/stopsbylocation?api_key=U1N8k74hBkK874ory82gZg&lat=#{@long}&lon=#{@lat}")
    req = Net::HTTP::Get.new(uri)
    req['Accept'] = 'application/json'

    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end
    format_results(JSON.parse(res.body))
  end

  def format_results(results)
   results["stop"]
  end


end
