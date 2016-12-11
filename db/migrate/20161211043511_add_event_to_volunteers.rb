class AddEventToVolunteers < ActiveRecord::Migration
  def change
    add_reference :volunteers, :event, index: true, foreign_key: true
    if volunteers = Volunteer.unscoped.where.not(event_id: nil)
      volunteers.each do |volunteer|
        volunteer.event_id = ActiveEvent.first.event_id
        volunteer.save
      end
    end
  end
end
