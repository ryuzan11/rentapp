class CreateWalkTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :walk_times do |t|
      t.string :walk_time
    end
  end
end
