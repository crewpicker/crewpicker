# encoding: UTF-8
class Volunteer < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  default_scope -> { where(event_id: ActiveEvent.first.event_id).order("volunteers.name") }
end
