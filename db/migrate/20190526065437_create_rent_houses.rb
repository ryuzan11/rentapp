class CreateRentHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :rent_houses do |t|
      t.references :user, foreign_key: true, null: false
      t.references :construction, foreign_key: true
      t.references :prefecture, foreign_key: true, null: false
      t.references :city, foreign_key: true, null: false
      t.references :walk_time, foreign_key: true
      t.references :layout, foreign_key: true
      t.references :building_type, foreign_key: true
      t.references :old, foreign_key: true
      t.string :station_name, null: false
      t.string :line_name
      t.integer :rent, null: false
      t.integer :management_fee
      t.integer :else_fee
      t.string :separate
      t.integer :floor
      t.string :woman
      t.string :balconi
      t.string :daylight
      t.text :comment
      t.string :room_size
      t.string :building_name

      t.timestamps
    end
  end
end
