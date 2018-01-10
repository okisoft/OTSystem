class CreatePublicLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :public_lectures do |t|
      t.belongs_to :user
      t.belongs_to :lecture
      t.belongs_to :lecture_time

      t.timestamps
    end
  end
end
