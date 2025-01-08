require "application_system_test_case"

class ChatRoomsTest < ApplicationSystemTestCase
  setup do
    @chat_room = chat_rooms(:one)
  end

  test "visiting the index" do
    visit chat_rooms_url
    assert_selector "h1", text: "Chat rooms"
  end

  test "should create chat room" do
    visit chat_rooms_url
    click_on "New chat room"

    fill_in "Title", with: @chat_room.title
    fill_in "User", with: @chat_room.user_id
    click_on "Create Chat room"

    assert_text "Chat room was successfully created"
    click_on "Back"
  end

  test "should update Chat room" do
    visit chat_room_url(@chat_room)
    click_on "Edit this chat room", match: :first

    fill_in "Title", with: @chat_room.title
    fill_in "User", with: @chat_room.user_id
    click_on "Update Chat room"

    assert_text "Chat room was successfully updated"
    click_on "Back"
  end

  test "should destroy Chat room" do
    visit chat_room_url(@chat_room)
    click_on "Destroy this chat room", match: :first

    assert_text "Chat room was successfully destroyed"
  end
end
