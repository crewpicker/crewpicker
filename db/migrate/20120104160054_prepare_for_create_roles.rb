class PrepareForCreateRoles < ActiveRecord::Migration
  def self.up
    change_table :user_roles do |t|
      t.references :role
    end
  end

  def self.down
    change_table :user_roles do |t|
      t.remove :role_id
    end
  end
end
