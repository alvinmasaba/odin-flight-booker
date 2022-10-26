class AddReferenceToPassengersOnBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :passenger
  end
end
