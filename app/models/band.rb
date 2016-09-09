# encoding: UTF-8
class Band < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, default_url: "missing_:style.png"
  has_many :band_members, :dependent => :destroy
  has_one :stage_schedule
  belongs_to :user
  belongs_to :event
  accepts_nested_attributes_for :band_members, :reject_if => lambda { |c| c[:name].blank? }
  default_scope { where(event_id: ActiveEvent.first.event_id) }
  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :contact_name, :presence => true
  validates :email, :presence => true
  validates_format_of :email, :with => /\A.+@.+\..+\z/
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validate :has_band_members

  def has_band_members
    errors.add(:base, 'må ha minst ett bandmedlem') if self. band_members.blank?
  end
end
