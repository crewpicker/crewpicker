class Volunteer < ActiveRecord::Base
  belongs_to :group
  default_scope :order => "volunteers.name"
end
