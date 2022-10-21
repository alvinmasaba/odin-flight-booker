class FlightsController < ActionController::Base
  def index
    @flights = Flight.all
  end
end
