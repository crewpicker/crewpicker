class CreateStageSchedules < ActiveRecord::Migration
  def self.up
    create_table :stage_schedules do |t|
      t.integer :stage_id
      t.string :band_id, :limit => 36
      t.datetime :from
      t.datetime :to

      t.timestamps
    end
  end

  def self.down
    drop_table :stage_schedules
  end
end
