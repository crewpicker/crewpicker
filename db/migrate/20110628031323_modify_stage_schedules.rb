class ModifyStageSchedules < ActiveRecord::Migration
  def self.up
    rename_column :stage_schedules, :from, :start
    rename_column :stage_schedules, :to, :end
  end

  def self.down
    rename_column :stage_schedules, :start, :from
    rename_column :stage_schedules, :end, :to
  end
end
