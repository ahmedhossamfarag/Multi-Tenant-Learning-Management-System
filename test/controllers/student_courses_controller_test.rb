require "test_helper"

class StudentCoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get student_courses_index_url
    assert_response :success
  end

  test "should get show" do
    get student_courses_show_url
    assert_response :success
  end
end
