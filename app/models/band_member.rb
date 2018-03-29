# encoding: UTF-8
class BandMember < ActiveRecord::Base
  belongs_to :band
  belongs_to :user
  default_scope -> { order :name }
  validates :name, :presence => true
  validates :phone, :presence => true
  validates :role, :presence => true

  def short_name
    band.name
  end
end
