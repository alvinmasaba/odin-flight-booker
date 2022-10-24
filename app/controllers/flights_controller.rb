class FlightsController < ActionController::Base
  def index
    @flights = Flight.search(params)
  end
end
