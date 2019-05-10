class AddColumnToUser2 < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string, null: true
    add_column :users, :message, :string
  end
end
