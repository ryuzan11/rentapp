class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :encrypted_password, :string, null: true
    add_column :users, :reset_password_token, :string, :unique => true
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :remember_created_at, :datetime
  end
end
