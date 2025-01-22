class InstructorCoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_instructor

  def index
    @courses = current_user.courses
  end

  def show
    @course = Course.find_by(id: params.expect!(:id), instructor_id: current_user.id)
    unless @course
      head :not_found
    end
  end

  private
  include Authorization
end
