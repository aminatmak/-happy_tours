class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    # Assigning a user to a specific booking
    @booking.user = current_user
    # Assigning a tour to a specific booking
    @booking.tour = Tour.find(params[:tour_id])
    authorize @booking

    if @booking.save
      redirect_to my_dashboard_path, notice: 'New booking created!'
    else
      render :new
    end
  end

  # def update
  #   @booking.update(booking_params)
  #   redirect_to @booking
  # end

  # def destroy
  #   @booking.destroy
  #   redirect_to root_path
  # end

  # private

  # def booking_params
  #   params.require(:booking).permit(:start_date, :end_date)
  # end
end
