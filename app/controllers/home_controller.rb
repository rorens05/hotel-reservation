class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  layout :custom_layout

  def index;
  end

  def hotels 
    @hotels = Hotel.all
    @hotels = @hotels.where("name LIKE ?", "%#{params[:search]}%") if params[:search].present?
  end

  def hotel_information
    @hotel = Hotel.find(params[:id])

  end

  def rooms 
    @room = Room.find(params[:id])
    @booking_transaction = BookingTransaction.new(
      room_id: @room.id, 
      user_id: current_user.id, 
      price: @room.price,
      schedule: DateTime.now
    )
  end

  def book_hotel
    @room = Room.find(params[:id])
    @booking_transaction = BookingTransaction.new(booking_transaction_params)
    @booking_transaction.room_id = @room.id
    @booking_transaction.user_id = current_user.id
    @booking_transaction.price = @room.price
    if @booking_transaction.save
      redirect_to home_orders_path, notice: 'Booking Successful'
    else
      render :rooms
    end
  end

  def orders 
    @booking_transactions = BookingTransaction.where(user_id: current_user.id)
  end

  def transaction_information
    @booking_transaction = BookingTransaction.find(params[:id])

  end

  private 

  def booking_transaction_params 
    params.require(:booking_transaction).permit(:price, :payment_method, :schedule)
  end

  def custom_layout 
    return 'report' if action_name = 'transaction_information'
    'application'
  end
end
