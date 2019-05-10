class RemoveCreatedAtFromGenders < ActiveRecord::Migration[5.2]
  def change
    remove_column :genders, :created_at, :datetime
  end
end
