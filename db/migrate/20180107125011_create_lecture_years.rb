class CreateLectureYears < ActiveRecord::Migration[5.1]
  def change
    create_table :lecture_years do |t|
      t.belongs_to :lecture,    foreign_key: true,
                                null: false
      t.integer :year,          null: false
      t.string :style ,         null: false

      t.timestamps
    end
  end
end
