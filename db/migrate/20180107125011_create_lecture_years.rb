class CreateLectureYears < ActiveRecord::Migration[5.1]
  def change
    create_table :lecture_years do |t|
      t.integer :year
      t.int :style

      t.timestamps
    end
  end
end
