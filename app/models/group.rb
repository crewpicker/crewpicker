class Group < ActiveRecord::Base
  has_many :volunteers
  default_scope :order => "groups.name"
end
