class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  protected

  def active_event_id
    ActiveEvent.first.event_id
  end
  def self.active_event_id
    ActiveEvent.first.event_id
  end
end
