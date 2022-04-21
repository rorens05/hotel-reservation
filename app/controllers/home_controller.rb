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

  private 

  def custom_layout 
    'application'
  end
end
