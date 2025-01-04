class Activity < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 200 }
  validates :event_day, presence: true

  has_one_attached :image
  validates :image, presence: true, content_type: %w[image/jpeg image/png image/jpg], size: { less_than: 5.megabytes }
end
