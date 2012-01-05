class RenameRoles < ActiveRecord::Migration
  def self.up
    rename_table :roles, :user_roles
  end

  def self.down
    rename_table :user_roles, :roles
  end
end
