class Payment < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :amount, presence: true, numericality: true
end
