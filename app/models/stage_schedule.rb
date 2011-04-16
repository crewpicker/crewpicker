class StageSchedule < ActiveRecord::Base
  belongs_to :stage
  belongs_to :band
  default_scope :order => "stage_schedules.from"
end
