class Ad < ActiveRecord::Base
  belongs_to :ad_type
  default_scope :order => "ads.name"
end
