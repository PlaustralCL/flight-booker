class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings



  def available_flights(params)
    return "" unless params[:flight].present?

    if (params[:flight][:departure_airport_id] == params[:flight][:arrival_airport_id])
      ""
    else
      Flight.where("departure_airport_id = ?", params[:flight][:departure_airport_id])
            .where("arrival_airport_id = ?", params[:flight][:arrival_airport_id])
            .order(:departure_time)
    end
  end
end
