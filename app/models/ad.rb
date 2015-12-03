# encoding: UTF-8
class Ad < ActiveRecord::Base
  belongs_to :ad_type
  default_scope -> { order :name }
end
