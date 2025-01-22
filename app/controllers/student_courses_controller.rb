class StudentCoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_student

  def index
    @courses = current_user.enrollments.joins(:course).select("courses.*")
  end

  def show
    enrollment = Enrollment.find_by(course_id: params.expect!(:id), student_id: current_user.id)
    if enrollment
      @course = enrollment.course
      @instructor = @course.instructor
      @contents = @course.course_contents
    else
      head :not_found
    end
  end

  include Authorization
end
