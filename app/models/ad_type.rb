# encoding: UTF-8
class AdType < ApplicationRecord
  has_many :ads
  default_scope -> { order :name }
end
