class AddUserIdToBands < ActiveRecord::Migration
  def self.up
    change_table :bands do |t|
      t.references :user
    end
    change_table :band_members do |t|
      t.references :user
    end
  end

  def self.down
    change_table :band_members do |t|
      t.remove :user_id
    end
    change_table :bands do |t|
      t.remove :user_id
    end
  end
end
