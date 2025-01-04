class CreateActivities < ActiveRecord::Migration[8.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :description
      t.date :event_day

      t.timestamps
    end
  end
end
