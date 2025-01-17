class Course < ApplicationRecord
  has_many :enrollments

  validates :title, presence: true, uniqueness: true
  validates :instructor_id, presence: true, numericality: { only_integer: true }
end
