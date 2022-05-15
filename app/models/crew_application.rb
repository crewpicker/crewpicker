# encoding: UTF-8
class CrewApplication < ApplicationRecord
  has_many :crew_wishes
  belongs_to :user
  belongs_to :volunteer
  belongs_to :event
  accepts_nested_attributes_for :crew_wishes
  default_scope -> { self.active_event.where chosen: false }
  scope :hidden, -> { self.active_event.where chosen: true }
  scope :active_event, -> { where event_id: active_event_id }
  validates :user_id, uniqueness: { scope: :active_event }
end
