class DashboardController < ApplicationController
  def profile
    authorize self
    @bookings = current_user.bookings
  end
end
