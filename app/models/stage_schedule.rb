# encoding: UTF-8
class StageSchedule < ActiveRecord::Base
  belongs_to :stage
  belongs_to :band
  default_scope :order => "stage_schedules.start"
end
