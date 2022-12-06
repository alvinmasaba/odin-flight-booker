class BookingsController < ActionController::Base
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    params[:num_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        @booking.passengers.each do |passenger|
          PassengerMailer.confirmation_email(passenger).deliver_later
        end

        format.html { redirect_to(@booking, notice: 'Your Flight Has Been Booked Successfully!') }
        format.json { render json: @booking, status: :created, location: @booking }
      else
        format.html { render action: 'new', notice: 'Booking Unsuccessful' }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
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
