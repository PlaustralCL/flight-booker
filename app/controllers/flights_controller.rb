class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.order(:code).map { |airport| [airport.code, airport.id] }
    @flights = Flight.new
    @flight_info = params[:flight].present? ? available_flights : ""
  end


  private

  def available_flights
    if params[:flight][:departure_airport_id] == params[:flight][:arrival_airport_id]
      ""
    else
      Flight.where("departure_airport_id = ?", params[:flight][:departure_airport_id]).and(Flight.where("arrival_airport_id = ?", params[:flight][:arrival_airport_id])).order(:departure_time)
    end
  end
end
