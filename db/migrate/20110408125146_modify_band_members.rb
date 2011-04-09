class ModifyBandMembers < ActiveRecord::Migration
  def self.up
    change_table :band_members do |t|
      t.integer :person_id
    end
  end

  def self.down
    change_table :band_members do |t|
      t.remove :person_id
    end
  end
end
