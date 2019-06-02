class CreateOlds < ActiveRecord::Migration[5.2]
  def change
    create_table :olds do |t|
      t.string :old
    end
  end
end
