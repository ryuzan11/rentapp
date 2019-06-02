class CreateBuildingTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :building_types do |t|
      t.string :building_type
    end
  end
end
