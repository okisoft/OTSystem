class CreateLectureTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :lecture_times do |t|
      t.integer :time
      t.string :title

      t.timestamps
    end
  end
end
