class ShareCapital < ApplicationRecord

  has_one_attached :image

  belongs_to :user
  enum status: [:pending, :approved, :rejected]

  validates :image, presence: true
  validates :amount, presence: true
  validates :content, presence: true


end
