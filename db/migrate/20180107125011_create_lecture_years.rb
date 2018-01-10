class CreateLectureYears < ActiveRecord::Migration[5.1]
  def change
    create_table :lecture_years do |t|
      t.belongs_to :lecture, foreign_key: true
      t.integer :year
      t.integer :style

      t.timestamps
    end
  end
end
