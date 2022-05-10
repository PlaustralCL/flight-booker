class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings
  has_many :passengers, through: :bookings

  scope :flight_details, ->(flight_id) { where("id = ?", flight_id )}


  def available_flights(params)
    return "" unless params[:flight].present?

    if (params[:flight][:departure_airport_id] == params[:flight][:arrival_airport_id])
      ""
    else
      Flight.includes(:departure_airport, :arrival_airport)
            .where("departure_airport_id = ?", params[:flight][:departure_airport_id])
            .where("arrival_airport_id = ?", params[:flight][:arrival_airport_id])
            .order(:departure_time)
    end
  end
end
