class LocationSchedule < ActiveRecord::Base
  belongs_to :location
  belongs_to :fireguard
end
