class CreateLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :lectures do |t|
      t.string :name,       null: false,
                            unique: true

      t.timestamps
    end
  end
end
