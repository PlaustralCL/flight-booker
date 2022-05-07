class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email

      t.timestamps
    end

    create_table :bookings_passengers, id: false do |t|
      t.belongs_to :booking
      t.belongs_to :passenger
    end
  end
end
