# encoding: UTF-8
class LocationSchedule < ApplicationRecord
  belongs_to :location
  belongs_to :fireguard
  default_scope -> { order :from }
end
