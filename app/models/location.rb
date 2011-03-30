class Location < ActiveRecord::Base
  has_many :location_schedules
end
