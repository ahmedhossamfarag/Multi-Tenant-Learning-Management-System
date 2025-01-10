class CourseContent < ApplicationRecord
  validates :course_id, presence: true
  validates :title, presence: true, uniqueness: { scope: :course_id }

  has_one_attached :file
  validates :file, presence: true, size: { less_than: 10.megabytes }
end
