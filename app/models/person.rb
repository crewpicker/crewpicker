# encoding: UTF-8
class Person < ApplicationRecord
  has_many :band_members
  default_scope -> { order("people.name") }
end
