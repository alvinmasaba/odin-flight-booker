class AddBookingReferenceToPassengers < ActiveRecord::Migration[7.0]
  def change
    add_reference :passengers, :booking, index: true
  end
end
