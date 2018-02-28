# encoding: UTF-8
class AdType < ActiveRecord::Base
  has_many :ads
  default_scope -> { order :name }
end
