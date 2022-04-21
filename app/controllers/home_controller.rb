class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  layout :custom_layout

  def index;
  end

  def faq

  end

  private 

  def custom_layout 
    'application'
  end
end
