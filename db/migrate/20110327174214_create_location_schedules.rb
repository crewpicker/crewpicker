class CreateLocationSchedules < ActiveRecord::Migration
  def self.up
    create_table :location_schedules do |t|
      t.integer :location_id
      t.integer :fireguard_id
      t.integer :slot
      t.datetime :from
      t.datetime :to

      t.timestamps
    end
  end

  def self.down
    drop_table :location_schedules
  end
end
