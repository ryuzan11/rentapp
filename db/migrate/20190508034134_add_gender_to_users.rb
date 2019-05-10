class AddGenderToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :gender, foreign_key: true
  end
end
