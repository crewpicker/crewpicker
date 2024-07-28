# encoding: UTF-8
class Group < ApplicationRecord
  has_many :volunteers
  has_many :crew_wishes
  has_many :tk81_pameldinger, class_name: 'Tk81Pamelding', foreign_key: 'foresatte_bidrag_id'
  default_scope -> { order :name }
end
