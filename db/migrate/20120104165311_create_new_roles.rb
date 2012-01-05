class CreateNewRoles < ActiveRecord::Migration
  class UserRole < ActiveRecord::Base
  end
  class Role < ActiveRecord::Base
  end
  def self.up
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end
    UserRole.reset_column_information
    Role.reset_column_information
    user_roles = UserRole.find(:all, :order => 'title, id', :limit => 100)
    role_names = user_roles.group_by { |t| t.title }
    role_names.each do |title, user_roles|
      say title
      role = Role.create(:name => title)
      user_roles.each do |user_role|
        user_role.role_id = role.id
        user_role.save
      end
    end
  end

  def self.down
    drop_table :roles
  end
end
