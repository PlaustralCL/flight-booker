class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.integer :departure_airport_id
      t.integer :arrival_airport_id
      t.time :departure_time
      t.time :arrival_time

      t.timestamps
    end
  end
end
