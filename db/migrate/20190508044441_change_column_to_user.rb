class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  # 変更内容
  def up
    change_column :users, :encrypted_password, :string, null: true, default: 0
    change_column :users, :reset_password_token, :string, unique: true
  end

  # 変更前の状態
  def down
    change_column :users, :encrypted_password, :string, null: false, default: 0
    change_column :users, :reset_password_token, :string
  end
end
