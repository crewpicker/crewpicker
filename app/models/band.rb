# encoding: UTF-8
class Band < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :band_members, :dependent => :destroy
  has_one :stage_schedule
  belongs_to :user
  default_scope :order => "bands.name"
  validates :name, :presence => true
  validates :name, :uniqueness => true
end
