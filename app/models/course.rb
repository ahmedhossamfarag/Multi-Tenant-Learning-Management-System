class Course < ApplicationRecord
  belongs_to :instructor, -> { where(role: :instructor) }, class_name: "User"
  has_many :enrollments
  has_many :course_contents

  validates :title, presence: true, uniqueness: true
  validates :instructor_id, presence: true, numericality: { only_integer: true }
end
