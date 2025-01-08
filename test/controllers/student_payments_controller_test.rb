require "test_helper"

class StudentPaymentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get student_payments_show_url
    assert_response :success
  end

  test "should get stripe" do
    get student_payments_stripe_url
    assert_response :success
  end

  test "should get success" do
    get student_payments_success_url
    assert_response :success
  end

  test "should get cancel" do
    get student_payments_cancel_url
    assert_response :success
  end
end
