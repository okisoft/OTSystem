class CreateProblems < ActiveRecord::Migration[5.1]
  def change
    create_table :problems do |t|
      t.belongs_to :lecture_time, foreign_key: true
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
