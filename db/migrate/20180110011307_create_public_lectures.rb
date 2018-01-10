class CreatePublicLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :public_lectures do |t|
      t.belongs_to :User
      t.belongs_to :Lecture
      t.belongs_to :LectureTime

      t.timestamps
    end
  end
end
