class PassengersController < ActionController::Base
  def new
    @passenger = Passenger.new
  end
end