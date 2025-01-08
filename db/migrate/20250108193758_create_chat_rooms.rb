class CreateChatRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :chat_rooms do |t|
      t.integer :user_id
      t.string :title

      t.timestamps
    end

    add_foreign_key :chat_rooms, :users, column: :user_id
  end
end
