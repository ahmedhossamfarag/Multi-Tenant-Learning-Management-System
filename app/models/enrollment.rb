class Enrollment < ApplicationRecord
  validates :student_id, presence: true
  validates :course_id, presence: true

  validates_uniqueness_of :student_id, scope: :course_id
end
