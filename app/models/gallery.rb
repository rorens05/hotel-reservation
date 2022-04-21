class Gallery < ApplicationRecord
  belongs_to :hotel, optional: true
  # belongs_to :room, optional: true
  has_one_attached :attachment
  enum file_type: %w[Image Video]
end
