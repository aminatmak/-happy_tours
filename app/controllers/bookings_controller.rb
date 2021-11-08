class BookingsController < ApplicationController
  before_action :set_booking, only: [:create, :edit, :update, :destroy]
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: 'New booking created!'
    else
      render :new
    end
  end

  def update
    @booking.update(booking_params)
    redirect_to @booking
  end

  def destroy
    @booking.destroy
    redirect_to root_path
  end
end
