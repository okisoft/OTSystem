class CreateAchievments < ActiveRecord::Migration[5.1]
  def change
    create_table :achievments do |t|
      t.belongs_to :user,    foreign_key: true
      t.belongs_to :problem, foreign_key: true

      t.timestamps
    end
  end
end
