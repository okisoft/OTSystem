class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :user_id,         null: false,
                                  unique: true
      t.string  :name,            null: false
      t.integer :authority,       null: false
      t.string  :password_digest, null: false

      t.timestamps
    end
  end
end
