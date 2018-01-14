class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.belongs_to :problem, foreign_key: true
      t.string :user_name
      t.string :group_name
      t.text :content
      t.string :reply
      t.boolean :visible

      t.timestamps
    end
  end
end
