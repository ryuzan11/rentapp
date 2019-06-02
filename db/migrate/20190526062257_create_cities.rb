class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.references :prefecture, foreign_key: true
      t.integer :city_cd
      t.string :city_name
    end
  end
end
