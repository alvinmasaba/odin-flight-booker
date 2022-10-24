class FlightsController < ActionController::Base
  def index
    @flights = Flight.search(params)
    @departure_airport_code = Airport.display_airport_code(params[:departure_airport_id])
    @arrival_airport_code = Airport.display_airport_code(params[:arrival_airport_id])
    @date = params[:date].to_datetime.strftime("%B %-d, %Y") unless params[:date] == ""
  end
end
