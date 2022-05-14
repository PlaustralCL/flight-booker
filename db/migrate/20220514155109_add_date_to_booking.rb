class AddDateToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :travel_date, :date
  end
end
