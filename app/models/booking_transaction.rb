class BookingTransaction < ApplicationRecord
  has_one_attached :screenshot
  belongs_to :user
  belongs_to :room
  enum status: %w[Unpaid Paid Cancelled]
  enum payment_method: %w[COD GCash]
  validates :price, presence: true
  validates :schedule, presence: true
  validates :payment_method, presence: true
  def name 
    self.transaction_number
  end

  def transaction_number
    "##{self.id.to_s.rjust(6, '0')}"
  end
end
