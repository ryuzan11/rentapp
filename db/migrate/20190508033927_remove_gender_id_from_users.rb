class RemoveGenderIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :gender_id, :integer
  end
end
