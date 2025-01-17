class StudentCoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_student

  def index
    @courses = Course.joins(:enrollments).where(enrollments: { student_id: current_user.id })
  end

  def show
    enrollment = Enrollment.find_by(course_id: params.expect!(:id), student_id: current_user.id)
    if enrollment
      @course = Course.find(enrollment.course_id)
      @contents = CourseContent.where(course_id: enrollment.course_id)
    else
      head :not_found
    end
  end

  include Authorization
end
