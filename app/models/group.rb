# encoding: UTF-8
class Group < ActiveRecord::Base
  has_many :volunteers
  has_many :crew_wishes
  default_scope :order => "groups.name"
end
