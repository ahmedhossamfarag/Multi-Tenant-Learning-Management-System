class InstructorCoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_instructor

  def index
    @courses = Course.where(instructor_id: current_user.id)
  end

  def show
    @course = Course.find_by(id: params.expect!(:id), instructor_id: current_user.id)
    if @course
      @contents = CourseContent.where(course_id: @course.id)
    else
      head :not_found
    end
  end

  private
  include Authorization
end
