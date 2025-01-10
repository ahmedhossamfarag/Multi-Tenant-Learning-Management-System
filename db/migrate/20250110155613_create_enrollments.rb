class CreateEnrollments < ActiveRecord::Migration[8.0]
  def change
    create_table :enrollments do |t|
      t.integer :student_id
      t.integer :course_id

      t.timestamps
    end

    add_foreign_key :enrollments, :users, column: :student_id
    add_foreign_key :enrollments, :courses, column: :course_id
  end
end
