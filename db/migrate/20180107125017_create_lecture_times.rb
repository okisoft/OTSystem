class CreateLectureTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :lecture_times do |t|
      t.belongs_to :lecture_year,  foreign_key: true,
                                      null: false
      t.integer :time,                null: false
      t.string :title

      t.timestamps
    end
  end
end
