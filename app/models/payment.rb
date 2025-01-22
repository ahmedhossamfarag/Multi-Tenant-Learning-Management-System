class Payment < ApplicationRecord
  belongs_to :user, -> { where(role: :student) }

  validates :title, presence: true
  validates :amount, presence: true, numericality: true
end
