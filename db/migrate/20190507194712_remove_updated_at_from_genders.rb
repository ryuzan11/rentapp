class RemoveUpdatedAtFromGenders < ActiveRecord::Migration[5.2]
  def change
    remove_column :genders, :Updated_at, :datetime
  end
end
