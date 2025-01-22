class CourseContentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_instructor
  before_action :set_course
  before_action :set_course_content, only: %i[ show edit update destroy ]

  # GET /course_contents or /course_contents.json
  def index
    @course_contents = CourseContent.where(course_id: @course.id)
  end

  # GET /course_contents/1 or /course_contents/1.json
  def show
  end

  # GET /course_contents/new
  def new
    @course_content = CourseContent.new
  end

  # GET /course_contents/1/edit
  def edit
  end

  # POST /course_contents or /course_contents.json
  def create
    @course_content = CourseContent.new(course_content_params)

    respond_to do |format|
      if @course_content.save
        format.html { redirect_to course_course_content_path(course_id: @course.id, id: @course_content.id), notice: "Course content was successfully created." }
        format.json { render :show, status: :created, location: @course_content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_contents/1 or /course_contents/1.json
  def update
    respond_to do |format|
      if @course_content.update(course_content_params)
        format.html { redirect_to course_course_content_path(course_id: @course.id, id: @course_content.id), notice: "Course content was successfully updated." }
        format.json { render :show, status: :ok, location: @course_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_contents/1 or /course_contents/1.json
  def destroy
    @course_content.destroy!

    respond_to do |format|
      format.html { redirect_to course_course_contents_path(course_id: @course.id), status: :see_other, notice: "Course content was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_course
      @course = Course.find_by(id: params.expect!(:course_id), instructor_id: current_user.id)
      unless @course
        head :not_found
      end
    end
    def set_course_content
      @course_content = CourseContent.find_by(id: params.expect(:id), course_id: @course.id)
      unless @course_content
        head :not_found
      end
    end

    # Only allow a list of trusted parameters through.
    def course_content_params
      params.expect(course_content: [ :course_id, :title, :description, :file ])
    end

  include Authorization
end
