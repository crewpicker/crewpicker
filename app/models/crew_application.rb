class CrewApplication < ActiveRecord::Base
  has_many :crew_wishes
  accepts_nested_attributes_for :crew_wishes
end
