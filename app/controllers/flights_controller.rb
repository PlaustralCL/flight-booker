class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.order(:code).map { |airport| [airport.code, airport.id] }
    @flights = Flight.new
    @search_results = available_flights
    @search_criteria = search_criteria
  end


  private

  def available_flights
    return "" unless params[:flight].present?

    if (params[:flight][:departure_airport_id] == params[:flight][:arrival_airport_id]) || params[:flight][:departure_airport_id] == "" || params[:flight][:arrival_airport_id] == ""
      ""
    else
      flights = Flight.where("departure_airport_id = ?", params[:flight][:departure_airport_id]).and(Flight.where("arrival_airport_id = ?", params[:flight][:arrival_airport_id]))
      flights.order(:arrival_time)
    end
  end

  def search_criteria
    if params[:flight].present?
      params[:flight]
    else
      { departure_airport_id: "1", arrival_airport_id: "4", passengers: "1", travel_date: Date.today.strftime("%F") }
    end
  end
end
