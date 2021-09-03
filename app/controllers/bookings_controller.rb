class BookingsController < ApplicationController



  def create
    @book = Booking.new(booking_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @service = Service.find(params[:id])
    @book.service = @service
    @book.save
    redirect_to root_path(@service)
  end

  private

  def booking_params
    params.require(:review).permit(:current_user.id, :@service.id)
  end

end
