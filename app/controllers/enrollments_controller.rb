class EnrollmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_instructor
  before_action :set_course
  before_action :set_enrollment, only: %i[destroy]

  def index
    @students = User.where(role: :student)
                    .joins("LEFT OUTER JOIN enrollments ON enrollments.student_id = users.id")
                    .select("users.*, enrollments.id as enrollment_id")
                    .to_ary
    @enrolled_students = @students.take_while { |s| s.enrollment_id != nil }
    @other_students = @students.take_while { |s| s.enrollment_id == nil }
  end

  def create
    @enrollment = Enrollment.new(course_id: @course.id, student_id: params.expect(:student_id))

    if @enrollment.save
      redirect_to action: :index, notice: "Enrollment was successfully created."
    else
      render action: :index, status: :unprocessable_entity
    end
  end

  def destroy
    @enrollment.destroy!

    redirect_to action: :index, status: :see_other, notice: "Enrollment was successfully destroyed."
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def set_course
    @course = Course.find_by(id: params.expect!(:course_id), instructor_id: current_user.id)
    unless @course
      head :not_found
    end
  end
  def set_enrollment
    @enrollment = Enrollment.find_by(id: params.expect(:id), course_id: @course.id)
    unless @enrollment
      head :not_found
    end
  end

  include Authorization
end
