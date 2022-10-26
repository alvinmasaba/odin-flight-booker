class RemovePassengerReferenceFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_reference :bookings, :passenger
  end
end
