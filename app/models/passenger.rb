class Passenger < ApplicationRecord
  has_and_belongs_to_many :bookings
  has_many :flights, through: :bookings

  # validates :email, uniqueness: true
  # before_validation :find_or_create_passenger

  private

  def find_or_create_passenger
    self.id = self.passenger.map do |passenger|
      Passenger.find_or_create_by(email: self.email).id
    end
  end
end
