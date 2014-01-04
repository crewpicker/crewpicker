# encoding: UTF-8
class BandMember < ActiveRecord::Base
  belongs_to :band
  belongs_to :person
  belongs_to :user
  default_scope -> { includes(:person).order("people.name") }
  accepts_nested_attributes_for :person
end
