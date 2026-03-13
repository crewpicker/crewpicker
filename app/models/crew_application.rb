class CrewApplication < ApplicationRecord
  has_many :crew_wishes
  belongs_to :user
  belongs_to :volunteer, optional: true
  belongs_to :event
  accepts_nested_attributes_for :crew_wishes, reject_if: ->(attributes) { attributes['group_id'].blank? }
  default_scope -> { active_event.where chosen: false }
  scope :hidden, -> { active_event.where chosen: true }
  scope :active_event, -> { where event_id: active_event_id }
  validates :user_id, uniqueness: { scope: :event_id }
end
