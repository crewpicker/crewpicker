class CrewApplication < ActiveRecord::Base
  has_many :crew_wishes
  belongs_to :user
  accepts_nested_attributes_for :crew_wishes
  default_scope :conditions => ('chosen IS NULL OR chosen = 0')
end
