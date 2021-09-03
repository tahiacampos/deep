class BookingsController < ApplicationController
  before_action :set_booking, only: [:new, :create]

  def new
    @book = Booking.new
  end

  def create
    @book = Booking.new(booking_params)
    @book.service = @service
    @book.user = current_user
    if @book.save
      redirect_to root_path
    end

    
  end

  private

  def set_booking
    @service = Service.find(params[:service_id])
  end

  def booking_params
    params.require(:booking).permit(:payment_method, :service_id, :current_user)
  end
end
