require "application_system_test_case"

class CourseContentsTest < ApplicationSystemTestCase
  setup do
    @course_content = course_contents(:one)
  end

  test "visiting the index" do
    visit course_contents_url
    assert_selector "h1", text: "Course contents"
  end

  test "should create course content" do
    visit course_contents_url
    click_on "New course content"

    fill_in "Course", with: @course_content.course_id
    fill_in "Description", with: @course_content.description
    fill_in "Title", with: @course_content.title
    click_on "Create Course content"

    assert_text "Course content was successfully created"
    click_on "Back"
  end

  test "should update Course content" do
    visit course_content_url(@course_content)
    click_on "Edit this course content", match: :first

    fill_in "Course", with: @course_content.course_id
    fill_in "Description", with: @course_content.description
    fill_in "Title", with: @course_content.title
    click_on "Update Course content"

    assert_text "Course content was successfully updated"
    click_on "Back"
  end

  test "should destroy Course content" do
    visit course_content_url(@course_content)
    click_on "Destroy this course content", match: :first

    assert_text "Course content was successfully destroyed"
  end
end
