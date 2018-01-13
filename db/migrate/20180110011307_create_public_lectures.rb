class CreatePublicLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :public_lectures do |t|
      t.belongs_to :user,            foreign_key: true
      t.belongs_to :lecture,         foreign_key: true
      t.belongs_to :lecture_time,    foreign_key: true

      t.timestamps
    end
  end
end
