class ChangeDatatypeGenderOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :gender_id, :integer
  end
end
