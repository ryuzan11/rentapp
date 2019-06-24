class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id, foreign_key: true
      t.integer :rent_house_id, foreign_key: true

      t.index :user_id
      t.index :rent_house_id
      t.index [:user_id, :rent_house_id], unique: true
    end
  end
end
