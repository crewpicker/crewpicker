# encoding: UTF-8
class Fireguard < ApplicationRecord
  has_many :location_schedules
  scope :active, -> { where("fireguards.active = 't'").order(:name) }
  default_scope -> { order(:name) }
end
