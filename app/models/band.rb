class Band < ActiveRecord::Base
  set_primary_key "uuid"
  include UuidHelper
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :band_members
  has_one :stage_schedule
end
