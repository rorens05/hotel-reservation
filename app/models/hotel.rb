class Hotel < ApplicationRecord
  has_one_attached :image
  has_many :gallery, dependent: :destroy
  has_many :rooms, dependent: :destroy
  accepts_nested_attributes_for :gallery, allow_destroy: true

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :phone, presence: true
  validates :email, presence: true, uniqueness: true
  validates :rules_and_policy, presence: true
end
