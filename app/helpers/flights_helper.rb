module FlightsHelper
  def available_flights(search_results)
    unless search_results.empty?
      render "search_results"
    end
  end
  def format_flight(flight)
    "#{flight.departure_time.localtime.strftime("%H:%M %p")} departure from "\
    "#{flight.departure_airport.code} with a #{flight.arrival_time.localtime.strftime("%H:%M %p")} "\
    "arrival at #{flight.arrival_airport.code}"
  end
end
