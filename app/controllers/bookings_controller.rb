class BookingsController < ActionController::Base
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    params[:num_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      flash[:notice] = "Your Flight Has Been Successfully Booked!"
      redirect_to @booking
    else
      flash.now[:notice] = "Booking Unsuccessful"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
