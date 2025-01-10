class CreateCourseContents < ActiveRecord::Migration[8.0]
  def change
    create_table :course_contents do |t|
      t.integer :course_id
      t.string :title
      t.string :description

      t.timestamps
    end

    add_foreign_key :course_contents, :courses, column: :course_id

  end

end
