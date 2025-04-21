# encoding: UTF-8
class Volunteer < ApplicationRecord
  belongs_to :group
  belongs_to :user
  belongs_to :event
  default_scope -> { where(event_id: active_event_id).order(:name) }
  scope :at_event, ->(event_id) { where(event_id: event_id).order(:name) }

  def short_name
    arr = name.split
    if arr.length < 2 or group.name == "Artist" or group.name == "Presse"
      name
    else
      res = []
      res << arr.shift
      while arr.length > 1
        res << "#{arr.shift[0]}."
      end
      res << arr.shift
      res.join(' ')
    end
  end

  def group_name
    group.name
  end
end
