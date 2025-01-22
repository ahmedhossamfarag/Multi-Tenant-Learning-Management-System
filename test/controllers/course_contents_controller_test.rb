require "test_helper"

class CourseContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
    @course_content = course_contents(:one)
  end

  test "should get index" do
    get course_course_contents_url
    assert_response :success
  end

  test "should get new" do
    get new_course_course_content_url
    assert_response :success
  end

  test "should create course_content" do
    assert_difference("CourseContent.count") do
      post course_course_contents_url, params: { course_content: { course_id: @course_content.course_id, description: @course_content.description, title: @course_content.title } }
    end

    assert_redirected_to course_course_content_url(CourseContent.last)
  end

  test "should show course_content" do
    get course_course_content_url(@course_content)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_course_content_url(@course_content)
    assert_response :success
  end

  test "should update course_content" do
    patch course_content_url(@course_content), params: { course_content: { course_id: @course_content.course_id, description: @course_content.description, title: @course_content.title } }
    assert_redirected_to course_content_url(@course_content)
  end

  test "should destroy course_content" do
    assert_difference("CourseContent.count", -1) do
      delete course_content_url(@course_content)
    end

    assert_redirected_to course_contents_url
  end
end
