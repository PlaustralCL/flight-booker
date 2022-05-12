module FlightsHelper
  def available_flights(search_results)
    unless search_results.empty?
      render "search_results"
    end
  end

  # def format_flight(flight)
  #   "#{flight.departure_time.localtime.strftime("%H:%M %p")} departure from "\
  #   "#{flight.departure_airport.code} with a #{flight.arrival_time.localtime.strftime("%H:%M %p")} "\
  #   "arrival at #{flight.arrival_airport.code}"
  # end

  def format_flight(flight)
    "Depart: #{flight_departure(flight)} -- Arrive: #{flight_arrival(flight)}"

  end

  def flight_departure(flight)
    "#{flight.departure_airport.city} (#{flight.departure_airport.code}) at #{flight.departure_time.localtime.strftime("%H:%M %p")}"
  end

  def flight_arrival(flight)
    "#{flight.arrival_airport.city} (#{flight.arrival_airport.code}) at #{flight.arrival_time.localtime.strftime("%H:%M %p")}"
  end
end
