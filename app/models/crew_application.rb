# encoding: UTF-8
class CrewApplication < ApplicationRecord
  has_many :crew_wishes
  belongs_to :user
  belongs_to :volunteer
  accepts_nested_attributes_for :crew_wishes
  default_scope -> { where("chosen IS NULL OR chosen = 'f'") }
  scope :hidden, -> { where("chosen = 1") }
  validates :user_id, :uniqueness => true
end
