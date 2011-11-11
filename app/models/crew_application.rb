class CrewApplication < ActiveRecord::Base
  has_many :crew_wishes
  belongs_to :user
  accepts_nested_attributes_for :crew_wishes
end
