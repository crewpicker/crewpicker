class Event < ApplicationRecord
  scope :active, -> { joins(:active_event) }
  has_one :active_event

  attr_accessor :set_as_active_event

  def active?
    if active_event and active_event.event == self
      true
    else
      false
    end
  end

  def set_as_active_event
    active?
  end
end
