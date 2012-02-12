class Volunteer < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  default_scope :order => "volunteers.name"
end
