# encoding: UTF-8
class Stage < ActiveRecord::Base
  has_many :stage_schedules
end
