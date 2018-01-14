class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.belongs_to :user,         foreign_key: true,
                                  null: false
      t.belongs_to :lecture_year, foreign_key: true,
                                  null: false

      t.timestamps
    end
  end
end
