class CreateCrewWishes < ActiveRecord::Migration
  def self.up
    create_table :crew_wishes do |t|
      t.integer :crew_application_id
      t.integer :group_id
      t.integer :priority

      t.timestamps
    end
  end

  def self.down
    drop_table :crew_wishes
  end
end
