class Fireguard < ActiveRecord::Base
  has_many :location_schedules
  scope :active, :conditions => "fireguards.active = TRUE", :order => "fireguards.name"
  default_scope :order => "fireguards.name"
end
