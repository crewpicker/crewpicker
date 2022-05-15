# encoding: UTF-8
class Ad < ApplicationRecord
  belongs_to :ad_type
  belongs_to :parent_ad, class_name: "Ad", foreign_key: "parent_ad_id"
  default_scope -> { order :name }
end
