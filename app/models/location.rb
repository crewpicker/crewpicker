# encoding: UTF-8
class Location < ApplicationRecord
  has_many :location_schedules
end
