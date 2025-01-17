class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.string :title
      t.float :amount
      t.string :stripe_session_id
      t.boolean :completed, default: false

      t.timestamps
    end

    add_foreign_key :payments, :users, column: :user_id
  end
end
