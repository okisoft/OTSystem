class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
    #   t.belongs_to :lecture_year, foreign_key: true
    #   t.string :name

    #   t.timestamps
    end
  end
end
