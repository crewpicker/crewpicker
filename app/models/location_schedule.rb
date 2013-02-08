# encoding: UTF-8
class LocationSchedule < ActiveRecord::Base
  belongs_to :location
  belongs_to :fireguard
  default_scope :order => "location_schedules.from"
end
