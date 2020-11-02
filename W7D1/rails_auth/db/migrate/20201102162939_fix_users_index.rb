class FixUsersIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, name: "index_users_on_session_id"
    add_index :users, :session_token, unique: true
  end
end
