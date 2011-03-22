class CreateBandMembers < ActiveRecord::Migration
  def self.up
    create_table :band_members do |t|
      t.string :band_id, :limit => 36
      t.string :name
      t.string :role

      t.timestamps
    end
  end

  def self.down
    drop_table :band_members
  end
end
