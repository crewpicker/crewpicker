class Fireguard < ActiveRecord::Base
  has_many :location_schedules
  scope :without_location_schedules, where("fireguards.id NOT IN (SELECT fireguard_id FROM location_schedules)")
end
