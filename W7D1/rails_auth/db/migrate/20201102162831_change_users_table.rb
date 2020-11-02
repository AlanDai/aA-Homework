class ChangeUsersTable < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :session_id, unique: true
  end
end
