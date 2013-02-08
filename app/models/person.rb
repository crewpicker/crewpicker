# encoding: UTF-8
class Person < ActiveRecord::Base
  has_many :band_members
  default_scope :order => "people.name"
end
