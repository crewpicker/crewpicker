# encoding: UTF-8
class Group < ApplicationRecord
  has_many :volunteers
  has_many :crew_wishes
  default_scope -> { order :name }
end
