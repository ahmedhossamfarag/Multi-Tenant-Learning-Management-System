class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description
      t.integer :instructor_id

      t.timestamps
    end

    add_foreign_key :courses, :users, column: :instructor_id
  end
end
