class AddDescriptionToGroups < ActiveRecord::Migration
  def self.up
    change_table :groups do |t|
      t.text :description
    end
  end

  def self.down
    change_table :groups do |t|
      t.remove :description
    end
  end
end
