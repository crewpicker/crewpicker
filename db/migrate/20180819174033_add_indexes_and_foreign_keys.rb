class AddIndexesAndForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :bands, :users
    add_index :bands, :user_id
    add_foreign_key :crew_applications, :users
    add_index :crew_applications, :user_id
    add_foreign_key :volunteers, :users
    add_index :volunteers, :user_id
    add_foreign_key :user_roles, :users
    add_index :user_roles, :user_id
    add_foreign_key :authentications, :users
    add_index :authentications, :user_id
  end
end
