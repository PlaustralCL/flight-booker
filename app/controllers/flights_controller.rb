class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.order(:code).map { |airport| [airport.code, airport.id] }
    @flights = Flight.new
    @search_results = Flight.new.available_flights(params)
    @search_criteria = search_criteria
  end


  private

  def search_criteria
    if params[:flight].present?
      params[:flight]
    else
      { departure_airport_id: "1", arrival_airport_id: "4", passengers: "1", travel_date: Date.today.strftime("%F") }
    end
  end
end
