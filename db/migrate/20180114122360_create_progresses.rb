class CreateProgresses < ActiveRecord::Migration[5.1]
  def change
    create_table :progresses do |t|
      t.belongs_to :lecture_time, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.belongs_to :group, foreign_key: true
      t.integer :icon

      t.timestamps
    end
  end
end
