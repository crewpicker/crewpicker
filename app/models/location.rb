# encoding: UTF-8
class Location < ActiveRecord::Base
  has_many :location_schedules
end
