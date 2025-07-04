class Enrollment < ApplicationRecord
  belongs_to :user, -> { where(role: :student) }, foreign_key: :student_id
  belongs_to :course

  validates :student_id, presence: true
  validates :course_id, presence: true

  validates_uniqueness_of :student_id, scope: :course_id
end
