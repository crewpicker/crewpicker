class AddEventIdToCrewApplications < ActiveRecord::Migration
  def change
    add_reference :crew_applications, :event, index: true, foreign_key: true
    if crew_applications = CrewApplication.unscoped.where(event_id: nil)
      crew_applications.each do |crew_application|
        crew_application.event_id = ActiveEvent.first.event_id
        crew_application.save
      end
    end
  end
end
