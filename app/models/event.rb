class Event < ActiveRecord::Base
  scope :active, -> { joins(:active_event) }
  has_one :active_event
end
