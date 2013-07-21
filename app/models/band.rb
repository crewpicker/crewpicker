# encoding: UTF-8
class Band < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :band_members, :dependent => :destroy
  has_one :stage_schedule
  belongs_to :user
  default_scope -> { order('bands.name DESC') }
  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :contact_name, :presence => true
  validates :email, :presence => true
  validates_format_of :email, :with => /\A.+@.+\..+\z/
end
