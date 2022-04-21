class Room < ApplicationRecord
  has_one_attached :image
  belongs_to :hotel
  validates :name, presence: true
  validates :price, presence: true

  def display_name
    "#{hotel.name} - #{name}"
  end
end
