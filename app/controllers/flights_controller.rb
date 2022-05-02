class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.order(:code).map { |airport| [airport.code, airport.id] }
    @flights = Flight.new
    @flight_info = params[:flight].present? ? available_flights : ""
    @selected_airports = target_aiports
  end


  private

  def available_flights
    if (params[:flight][:departure_airport_id] == params[:flight][:arrival_airport_id]) || params[:flight][:departure_airport_id] == "" || params[:flight][:arrival_airport_id] == ""
      ""
    else
      flights = Flight.where("departure_airport_id = ?", params[:flight][:departure_airport_id]).and(Flight.where("arrival_airport_id = ?", params[:flight][:arrival_airport_id]))
      flights.order(:arrival_time)
    end
  end

  def target_aiports
    if params[:flight].present?
      { departure_airport_id: params[:flight][:departure_airport_id], arrival_airport_id: params[:flight][:arrival_airport_id] }
    else
      { departure_airport_id: "1", arrival_airport_id: "4"}
    end
  end
end
