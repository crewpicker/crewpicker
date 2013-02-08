# encoding: UTF-8
class CrewApplication < ActiveRecord::Base
  has_many :crew_wishes
  belongs_to :user
  belongs_to :volunteer
  accepts_nested_attributes_for :crew_wishes
  default_scope :conditions => ("chosen IS NULL OR chosen = 'f'")
  scope :hidden, :conditions => ("chosen = 't'")
end
