class AccessLevel < ActiveRecord::Base
  has_many :volunteers, :primary_key => "name", :foreign_key => "access_level"
  default_scope :order => "access_levels.name"
end