# encoding: UTF-8
class Volunteer < ApplicationRecord
  belongs_to :group
  belongs_to :user
  default_scope -> { where(event_id: ActiveEvent.first.event_id).order("volunteers.name") }

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
end
