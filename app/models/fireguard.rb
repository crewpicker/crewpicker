# encoding: UTF-8
class Fireguard < ActiveRecord::Base
  has_many :location_schedules
  scope :active, :conditions => "fireguards.active = 't'", :order => "fireguards.name"
  default_scope { order :name }
end
